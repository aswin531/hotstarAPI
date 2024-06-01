import 'package:flutter/material.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:hotstar/screens/details/detailedmovie.dart';
import 'package:hotstar/screens/details/suggestions.dart';
import 'package:hotstar/utils/colors.dart';

class DetailedScreen extends StatelessWidget {
  final MovieCopy movieCopy;
  const DetailedScreen({super.key, required this.movieCopy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: lightblack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailedMovieScreen(
              movieCopy: movieCopy,
              imageurl:
                  "https://image.tmdb.org/t/p/original/${movieCopy.posterPath}",
            ),
            const SuggestionsScreen(),
          ],
        ),
      ),
    );
  }
}
