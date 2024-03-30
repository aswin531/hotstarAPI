import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 8,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.78,
            color: primary,
          );
        },
        options: CarouselOptions(
            aspectRatio: 16 / 14,
            autoPlay: true,
            viewportFraction: 0.6,
            autoPlayAnimationDuration: const Duration(seconds: 3)));
  }
}
