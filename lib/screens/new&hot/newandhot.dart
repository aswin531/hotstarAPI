import 'package:flutter/material.dart';

class NewandHotScreen extends StatefulWidget {
  const NewandHotScreen({super.key});

  @override
  State<NewandHotScreen> createState() => _NewandHotScreenState();
}

class _NewandHotScreenState extends State<NewandHotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/newhot.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          // child: Center(
          //   // You can add other widgets on top of the background image
          //   child: Text(
          //     'Your Content Here',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
