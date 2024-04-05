import 'dart:convert';

import 'package:hotstar/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=f090e64e76bd9335bbb96eefcaf2d64a";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=f090e64e76bd9335bbb96eefcaf2d64a";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=f090e64e76bd9335bbb96eefcaf2d64a";
  final topTvRatedApiUrl =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=f090e64e76bd9335bbb96eefcaf2d64a";

  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(upComingApiUrl as Uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load Upcoming Movies");
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load Upcoming Movies");
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
