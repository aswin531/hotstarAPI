import 'package:flutter/material.dart';
import 'package:hotstar/screens/details/detailedscreen.dart';
import 'package:hotstar/screens/home/widgets/content.dart';
import 'package:hotstar/utils/colors.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            ContentSection(
              title: "Best in Sports",
              itemHeight: MediaQuery.of(context).size.height * 0.15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedScreen(),
                      ));
                    },
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
            ContentSection(
              title: "Latest Releases",
              itemHeight: MediaQuery.of(context).size.height * 0.22,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedScreen(),
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.31,
                        color: color3,
                      ),
                    ),
                  ),
                );
              },
            ),
            ContentSection(
              title: "Asianet Shows",
              itemHeight: MediaQuery.of(context).size.height * 0.22,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedScreen(),
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.31,
                        color: color3,
                      ),
                    ),
                  ),
                );
              },
            ),
            ContentSection(
              title: "Hotstar Specials",
              itemHeight: MediaQuery.of(context).size.height * 0.32,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedScreen(),
                      ));
                    },
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
            ContentSection(
              title: "Popular Shows",
              itemHeight: MediaQuery.of(context).size.height * 0.22,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedScreen(),
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.31,
                        color: color3,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
