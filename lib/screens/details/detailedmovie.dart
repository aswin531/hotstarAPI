import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotstar/models/movies.dart';
import 'package:hotstar/screens/details/button.dart';
import 'package:hotstar/screens/details/widgets/richtext.dart';
import 'package:hotstar/screens/details/widgets/texticon.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/styles.dart';

class DetailedMovieScreen extends StatefulWidget {
  final Movie movie;

  const DetailedMovieScreen({super.key, required this.movie});

  @override
  State<DetailedMovieScreen> createState() => _DetailedMovieScreenState();
}

class _DetailedMovieScreenState extends State<DetailedMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: 1,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: primary,
                    child: CachedNetworkImage(
                      imageUrl: widget.movie.backdropPath ?? "",
                    ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 16 / 10,
                  autoPlay: false,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                    iconSize: 26,
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 110,
          ),
          const DetailedButton(),
          Container(
            color: lightblack,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const CustomText(
                    segments: [
                      TextSegment(text: 'Drama', color: Colors.white),
                      TextSegment(text: 'Legal', color: Colors.white),
                      TextSegment(text: 'Intense', color: Colors.white),
                      TextSegment(
                          text: 'For Raveena Tandore Fans',
                          color: Colors.white),
                      TextSegment(
                          text: 'Metropolis/Big City', color: Colors.white),
                      TextSegment(text: 'Movie', color: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "When a helpless student has nowhere to turn to except a housewife who also a small time lawyer, when they uncover is a quagmire of an educational scam.",
                    style: MyTextStyles.subheadingStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      DynamicIconTextWidget(
                          iconData: Icons.add, text: "Watchlist"),
                      SizedBox(
                        width: 20,
                      ),
                      DynamicIconTextWidget(
                          iconData: FontAwesomeIcons.share, text: "Share"),
                      SizedBox(
                        width: 20,
                      ),
                      DynamicIconTextWidget(
                          iconData: Icons.download, text: "Download")
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
