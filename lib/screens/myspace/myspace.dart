import 'package:flutter/material.dart';
import 'package:hotstar/screens/myspace/widgets/body.dart';
import 'package:hotstar/utils/colors.dart';

class MySpaceScreen extends StatelessWidget {
  const MySpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        backgroundColor: primary,
        elevation: 0,
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: lightblack,
      body: Container(
        decoration: BoxDecoration(gradient: customGradient),
        child: const Column(
          children: [
            BodyMySpace(),
          ],
        ),
      ),
    );
  }
}
