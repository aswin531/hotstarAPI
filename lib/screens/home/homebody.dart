// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/models/movies.dart';
import 'package:hotstar/screens/details/detailedscreen.dart';
import 'package:hotstar/screens/home/widgets/content.dart';
import 'package:hotstar/utils/colors.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> upcomingMovies;
  // late Future<List<Movie>> asianetTvRatedMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> topTvRatedMovies;
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    popularMovies = Api().getPopularMovies();
    upcomingMovies = Api().getUpComingMovies();
    topRatedMovies = Api().gettopRatedMovies();
    topTvRatedMovies = Api().gettopTvRatedMovies();
  }

void _navigateToDetailedScreen(BuildContext context, Movie movie) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => DetailedScreen(movie: movie),
  ));
}

  Widget _buildContentSection(
    BuildContext context,
    String title,
    List<Movie> movies,
    double itemHeight,
    double itemWidth,
  ) {
    return ContentSection(
      title: title,
      itemHeight: itemHeight,
      itemBuilder: (context, index) {
        final Movie movie = movies[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => _navigateToDetailedScreen(context,movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: itemWidth,
                height: itemHeight,
                color: color3,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        loadPopularMovies(),
        loadUpcomingMovies(),
        loadTopRatedMovies(),
        loadTopTvRatedMovies(),
      ]),
      builder: (context, AsyncSnapshot<List<List<Movie>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final popularMovies = snapshot.data![0];
          final upcomingMovies = snapshot.data![1];
          final topRatedMovies = snapshot.data![2];
          final topTvRatedMovies = snapshot.data![3];

          final popularMoviesItemHeight =
              MediaQuery.of(context).size.height * 0.15;
          final popularMoviesItemWidth =
              MediaQuery.of(context).size.width * 0.45;

          final upcomingMoviesItemHeight =
              MediaQuery.of(context).size.height * 0.22;
          final upcomingMoviesItemWidth =
              MediaQuery.of(context).size.width * 0.297;

          final extraMoviesItemHeight =
              MediaQuery.of(context).size.height * 0.22;
          final extraMoviesItemWidth =
              MediaQuery.of(context).size.width * 0.297;

          final topRatedMoviesItemHeight =
              MediaQuery.of(context).size.height * 0.32;
          final topRatedMoviesItemWidth =
              MediaQuery.of(context).size.width * 0.45;

          final topTvRatedMoviesItemHeight =
              MediaQuery.of(context).size.height * 0.22;
          final topTvRatedMoviesItemWidth =
              MediaQuery.of(context).size.width * 0.297;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (popularMovies.isNotEmpty)
                    _buildContentSection(
                      context,
                      "Best in Shows",
                      popularMovies,
                      popularMoviesItemHeight,
                      popularMoviesItemWidth,
                    ),
                  if (upcomingMovies.isNotEmpty)
                    _buildContentSection(
                      context,
                      "Latest Releases",
                      upcomingMovies,
                      upcomingMoviesItemHeight,
                      upcomingMoviesItemWidth,
                    ),
                  if (upcomingMovies.isNotEmpty)
                    _buildContentSection(
                      context,
                      "Asianet Shows",
                      topTvRatedMovies,
                      extraMoviesItemHeight,
                      extraMoviesItemWidth,
                    ),
                  if (topRatedMovies.isNotEmpty)
                    if (topRatedMovies.isNotEmpty)
                      _buildContentSection(
                        context,
                        "Hotstar Specials",
                        topRatedMovies,
                        topRatedMoviesItemHeight,
                        topRatedMoviesItemWidth,
                      ),
                  if (topTvRatedMovies.isNotEmpty)
                    _buildContentSection(
                      context,
                      "Popular Shows",
                      topTvRatedMovies,
                      topTvRatedMoviesItemHeight,
                      topTvRatedMoviesItemWidth,
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<List<Movie>> loadPopularMovies() async {
    final api = Api();
    return await api.getPopularMovies();
  }

  Future<List<Movie>> loadUpcomingMovies() async {
    final api = Api();
    return await api.getUpComingMovies();
  }

  Future<List<Movie>> loadTopRatedMovies() async {
    final api = Api();
    return await api.gettopRatedMovies();
  }

  Future<List<Movie>> loadTopTvRatedMovies() async {
    final api = Api();
    return await api.gettopTvRatedMovies();
  }
}
