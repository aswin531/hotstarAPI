import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotstar/screens/home/homebody.dart';
import 'package:hotstar/screens/home/widgets/homecarousel.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/icons.dart';
import 'package:hotstar/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblack,
      body: Column(
        children: [
          Stack(
            children: [
              const HomeScreenBody(),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Image.asset(pIconBg),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.135,
                            height: MediaQuery.of(context).size.height * 0.018,
                            decoration: BoxDecoration(
                              color: transparent,
                              borderRadius: BorderRadius.circular(3),
                              border:
                                  Border.all(width: 1, color: transparentGold),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "SUBSCRIBE",
                                textAlign: TextAlign.center,
                                style: MyTextStyles.subtextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(Icons.cast, color: Colors.white),
                          const SizedBox(width: 15),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(child: HomeContentScreen())
        ],
      ),
    );
  }
}
