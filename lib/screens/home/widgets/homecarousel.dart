import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:hotstar/screens/details/detailedscreen.dart';
import 'package:hotstar/utils/colors.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        final MovieCopy movieCopy = snapshot.data[itemIndex];
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    lightblack.withOpacity(0.2),
                    BlendMode.srcOver,
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${movieCopy.posterPath ?? ''}",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width * 0.95,
                    filterQuality: FilterQuality.high,
                    fadeInCurve: Curves.easeIn,
                    maxWidthDiskCache: 500,
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutCurve: Curves.easeOut,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => gotoDetailedScreen(context, movieCopy),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text(
                  movieCopy.title ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        aspectRatio: 14 / 15,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
      ),
    );
  }

  void gotoDetailedScreen(BuildContext context, MovieCopy movieCopy) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailedScreen(movieCopy: movieCopy),
      ),
    );
  }
}
