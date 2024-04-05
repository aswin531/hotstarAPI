// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:hotstar/api/apiconstants.dart';
import 'package:hotstar/api/exceptions.dart';
import 'package:hotstar/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  // final apiDetails = ApiDetails();
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiDetails.apiKey}";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${ApiDetails.apiKey}";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiDetails.apiKey}";
  final topTvRatedApiUrl =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=${ApiDetails.apiKey}";

  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load Upcoming Movies");
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse(popularApiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
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
                errorMessage.isNotEmpty ? errorMessage : "Unauthorized");
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
                "Failed to load Popular Movies. Status code: ${response.statusCode}");
        }
      }
    }  catch (e) {
      print('Exception occurred: $e');
      // ScaffoldMessenger.of().showSnackBar(SnackBar(
      //   content: Text('Error: $e'),
      // ));
      // Rethrow the exception to propagate it further
      rethrow;
    }
  }

  Future<List<Movie>> gettopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load Upcoming Movies");
    }
  }

  Future<List<Movie>> gettopTvRatedMovies() async {
    final response = await http.get(Uri.parse(topTvRatedApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load Upcoming Movies");
    }
  }
}
