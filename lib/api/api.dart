// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:hotstar/api/apiconstants.dart';
import 'package:hotstar/api/exceptions.dart';
import 'package:hotstar/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = "https://api.themoviedb.org/3/";

  Future<List<Movie>> _fetchMovies(String endpoint) async {
    const String apiKey = ApiDetails.apiKey;
    final url = Uri.parse("$_baseUrl$endpoint?api_key=$apiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        List<Movie> movies =
            data.map((movie) => Movie.fromMap(movie, 'latest')).toList();
        return movies;
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

  Future<List<Movie>> getPopularMovies() async {
    return _fetchMovies("tv/popular");
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return _fetchMovies("tv/on_the_air");
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return _fetchMovies("movie/top_rated");
  }

  Future<List<Movie>> getTopRatedTvShows() async {
    return _fetchMovies("tv/top_rated");
  }

  Future<List<Movie>> getnowPLaying() {
    return _fetchMovies("movie/now_playing");
  }

  gettopTvRatedMovies() {}
}
