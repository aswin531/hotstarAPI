// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:hotstar/api/apiconstants.dart';
import 'package:hotstar/api/exceptions.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:http/http.dart' as http;

class ApiCopy {
  final String _baseUrl = "https://api.themoviedb.org/3/";

  Future<List<MovieCopy>> _fetchCopyMovies(String endpoint) async {
    const String apiKey = ApiDetails.apiKey;
    final url = Uri.parse("$_baseUrl$endpoint?api_key=$apiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body)["results"] as List;
        print(decodeData);
        return decodeData
            .map((moviecopy) => MovieCopy.fromJson(moviecopy))
            .toList();
      } else {
        String errorMessage = '';
        if (response.body.isNotEmpty) {
          errorMessage = json.decode(response.body)['status_message'];
        }
        switch (response.statusCode) {
          case 400:
            throw BadRequestException(
                errorMessage.isNotEmpty ? errorMessage : "Bad request");
          case 401:
            throw UnauthorizedException(
                errorMessage.isNotEmpty ? errorMessage : "Unauthorised");
          case 403:
            throw ForbiddenException(
                errorMessage.isNotEmpty ? errorMessage : "Forbidden");
          case 404:
            throw NotFoundException(
                errorMessage.isNotEmpty ? errorMessage : "Not found");
          case 500:
            throw InternalServerErrorException(errorMessage.isNotEmpty
                ? errorMessage
                : "Internal server error");
          default:
            throw Exception(
                "Failed to load movies. Status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      print("Excption occurred : $e");
      rethrow;
    }
  }

  Future<List<MovieCopy>> getPopularMovies() async {
    return _fetchCopyMovies("tv/popular");
  }

  Future<List<MovieCopy>> getUpcomingMovies() async {
    return _fetchCopyMovies("tv/on_the_air");
  }

  Future<List<MovieCopy>> getTopRatedMovies() async {
    return _fetchCopyMovies("movie/top_rated");
  }

  Future<List<MovieCopy>> getTopRatedTvShows() async {
    return _fetchCopyMovies("tv/top_rated");
  }

  Future<List<MovieCopy>> getnowPLaying() {
    return _fetchCopyMovies("movie/now_playing");
  }

  gettopTvRatedMovies() {}
}
