import 'package:flutter/material.dart';
import 'package:hotstar/screens/home/widgets/content.dart';
import 'package:hotstar/utils/colors.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentSection(
          title: "More Like This",
          itemHeight: MediaQuery.of(context).size.height * 0.22,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.31,
                  color: color3,
                ),
              ),
            );
          },
        ),
        ContentSection(
          title: "Trailers & More",
          itemHeight: MediaQuery.of(context).size.height * 0.15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    color: color3,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
