import 'package:flutter/material.dart';
import 'package:hotstar/screens/myspace/widgets/button.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/images.dart';
import 'package:hotstar/utils/styles.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: lightblack,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Downloads",
                style: MyTextStyles.headinglightStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(downloads),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "No Downloads Available",
                      style: MyTextStyles.headingStyle,
                    ),
                  ),
                  Text(
                    "Explore and download your favourite movies and shows to watch on the go",
                    style: MyTextStyles.subheadingStyle,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.076,
                    child: MyButton(
                      text: " Go to Home",
                      onPressed: () {},
                      color: white,
                      textColor: black,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
