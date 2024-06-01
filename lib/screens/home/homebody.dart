import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/api/apicopy.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:hotstar/screens/details/detailedscreen.dart';
import 'package:hotstar/screens/home/widgets/content.dart';
import 'package:hotstar/utils/colors.dart';

class HomeContentScreen extends StatefulWidget {
  // final AsyncSnapshot snapshot;
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  late Future<List<MovieCopy>> popularCopyMovie;
  late Future<List<MovieCopy>> upcomingCopyMovies;
  late Future<List<MovieCopy>> topRatedCopyMovie;
  late Future<List<MovieCopy>> topTvRatedCopyMovie;
  late Future<List<MovieCopy>> tvOnAirrCopyMovie;

  @override
  void initState() {
    super.initState();
    popularCopyMovie = ApiCopy().getPopularMovies();
    upcomingCopyMovies = ApiCopy().getnowPLaying();
    topRatedCopyMovie = ApiCopy().getTopRatedMovies();
    topTvRatedCopyMovie = ApiCopy().getTopRatedTvShows();
    tvOnAirrCopyMovie = ApiCopy().getUpcomingMovies();
  }

  Widget _buildContentSection(
    BuildContext context,
    String title,
    Future<List<MovieCopy>> future,
    double itemHeight,
    double itemWidth,
  ) {
    return FutureBuilder<List<MovieCopy>>(
      future: future,
      builder: (context, AsyncSnapshot<List<MovieCopy>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final movies = snapshot.data!;
          return Column(
            children: [
              ContentSection(
                title: title,
                itemHeight: itemHeight,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final MovieCopy movieCopy = movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () => DetailedScreen(movieCopy: movieCopy),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: itemWidth,
                          height: itemHeight,
                          color: color3,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/original/${movieCopy.backDropPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final popularMoviesItemHeight = MediaQuery.of(context).size.height * 0.15;
    final popularMoviesItemWidth = MediaQuery.of(context).size.width * 0.45;

    final upcomingMoviesItemHeight = MediaQuery.of(context).size.height * 0.22;
    final upcomingMoviesItemWidth = MediaQuery.of(context).size.width * 0.297;

    final topRatedMoviesItemHeight = MediaQuery.of(context).size.height * 0.32;
    final topRatedMoviesItemWidth = MediaQuery.of(context).size.width * 0.45;

    final topTvRatedMoviesItemHeight =
        MediaQuery.of(context).size.height * 0.22;
    final topTvRatedMoviesItemWidth = MediaQuery.of(context).size.width * 0.297;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            _buildContentSection(
              context,
              "Best in Shows",
              popularCopyMovie,
              popularMoviesItemHeight,
              popularMoviesItemWidth,
            ),
            _buildContentSection(
              context,
              "Latest Releases",
              upcomingCopyMovies,
              upcomingMoviesItemHeight,
              upcomingMoviesItemWidth,
            ),
            _buildContentSection(
              context,
              "Top Rated Movies",
              topRatedCopyMovie,
              topRatedMoviesItemHeight,
              topRatedMoviesItemWidth,
            ),
            _buildContentSection(
              context,
              "Top Rated TV Shows",
              topTvRatedCopyMovie,
              topTvRatedMoviesItemHeight,
              topTvRatedMoviesItemWidth,
            ),
            _buildContentSection(
              context,
              "TV Shows on Air",
              tvOnAirrCopyMovie,
              topTvRatedMoviesItemHeight,
              topTvRatedMoviesItemWidth,
            ),
          ],
        ),
      ),
    );
  }

  void gotoDetailedScreen(BuildContext context, MovieCopy moviecopy) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailedScreen(movieCopy: moviecopy),
    ));
  }
}
