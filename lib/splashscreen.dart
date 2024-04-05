import 'package:flutter/material.dart';
import 'package:hotstar/screens/home/bottomnavbar.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  final String videoAsset;
  const SplashScreen({super.key, required this.videoAsset});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;
  Future<void> navigateHome() async {
    await Future.delayed(const Duration(seconds:5));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const BottomNavBarScreen(),
    ));
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
        navigateHome();
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller?.value.isInitialized ?? false
        ? SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          )
        :const Text("data");
  }
}
