import 'package:flutter/material.dart';
import 'package:hotstar/screens/details/detailedscreen.dart';
import 'package:hotstar/screens/home/widgets/content.dart';
import 'package:hotstar/utils/colors.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  void _navigateToDetailedScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const DetailedScreen(),
    ));
  }

  Widget _buildContentSection(
      BuildContext context, String title, double itemHeight, double itemWidth) {
    return ContentSection(
      title: title,
      itemHeight: itemHeight,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => _navigateToDetailedScreen(context),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildContentSection(
                context,
                "Best in Sports",
                MediaQuery.of(context).size.height * 0.15,
                MediaQuery.of(context).size.width * 0.47),
            _buildContentSection(
                context,
                "Latest Releases",
                MediaQuery.of(context).size.height * 0.22,
                MediaQuery.of(context).size.width * 0.31),
            _buildContentSection(
                context,
                "Asianet Shows",
                MediaQuery.of(context).size.height * 0.22,
                MediaQuery.of(context).size.width * 0.31),
            _buildContentSection(
                context,
                "Hotstar Specials",
                MediaQuery.of(context).size.height * 0.32,
                MediaQuery.of(context).size.width * 0.47),
            _buildContentSection(
                context,
                "Popular Shows",
                MediaQuery.of(context).size.height * 0.22,
                MediaQuery.of(context).size.width * 0.31),
          ],
        ),
      ),
    );
  }
}
