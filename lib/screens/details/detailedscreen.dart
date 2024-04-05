import 'package:flutter/material.dart';
import 'package:hotstar/models/movies.dart';
import 'package:hotstar/screens/details/detailedmovie.dart';
import 'package:hotstar/screens/details/suggestions.dart';
import 'package:hotstar/utils/colors.dart';

class DetailedScreen extends StatelessWidget {
  final Movie movie;
  const DetailedScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: lightblack,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            DetailedMovieScreen(movie: movie),
            const SuggestionsScreen(),
          ],
        ),
      ),
    );
  }
}
