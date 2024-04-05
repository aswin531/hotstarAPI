import 'package:flutter/material.dart';
import 'package:hotstar/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney Hotstar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashScreen(videoAsset:'assets/videos/splashtest.mp4',),
      debugShowCheckedModeBanner: false,
    );
  }
}
