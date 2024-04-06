import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/models/movies.dart';
import 'package:hotstar/utils/colors.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          final movie = movies[itemIndex];
          return Stack(children: [
            CachedNetworkImage(
              imageUrl:
                  "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _onMovieTap(context, movie),
                ),
              ),
            ),
          ]);
        },
        options: CarouselOptions(
            aspectRatio: 15.5 / 13,
            // enlargeCenterPage: true,
            // pageSnapping: true,
            autoPlay: true,
            viewportFraction: 1.5,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOut,
            enableInfiniteScroll: true));
  }

  void _onMovieTap(BuildContext context, Movie movie) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primary,
        content: Text(movie.title!),
        duration: const Duration(seconds: 2), // Adjust duration as needed
      ),
    );
  }
}
