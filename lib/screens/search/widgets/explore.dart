import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';

class ExploreItem {
  final double aspectRatio;
  final Color color;

  ExploreItem({
    required this.aspectRatio,
    required this.color,
  });
}

class SearchStaggeredScreen extends StatefulWidget {
  const SearchStaggeredScreen({super.key});

  @override
  State<SearchStaggeredScreen> createState() => _SearchStaggeredScreenState();
}

class _SearchStaggeredScreenState extends State<SearchStaggeredScreen> {
  List<ExploreItem> exploreItems = [
    ExploreItem(
      aspectRatio: 1.0,
      color: Colors.white,
    ),
    ExploreItem(
      aspectRatio: 0.5,
      color: Colors.grey,
    ),
    ExploreItem(
      aspectRatio: 1.0,
      color: primary,
    ),
    ExploreItem(
      aspectRatio: 1.0,
      color: Colors.transparent,
    ),
    ExploreItem(
      aspectRatio: 2.0,
      color: Colors.transparent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1.0, // Adjust as needed
      ),
      itemCount: exploreItems.length,
      itemBuilder: (context, index) => Tile(index: index),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;

  const Tile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, 
      child: Center(
        child: Text(
          'Tile $index',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
