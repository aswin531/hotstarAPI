import 'package:flutter/material.dart';
import 'package:hotstar/screens/details/detailedmovie.dart';
import 'package:hotstar/screens/details/suggestions.dart';
import 'package:hotstar/utils/colors.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: lightblack,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DetailedMovieScreen(),
            SuggestionsScreen(),
          ],
        ),
      ),
    );
  }
}
