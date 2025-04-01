import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_app/authentication/selectionScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const SelectionScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              Color.fromRGBO(68, 194, 252, 1),
              Color.fromRGBO(171, 230, 255, 1),
            ],
          ),
        ),
        child: Center(
          child: Image.asset("assets/splash.png"),
        ),
      ),
    );
  }
}
