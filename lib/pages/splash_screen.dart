import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.to(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060C1F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/logo.png", width: 250),
            Container(),
          ],
        ),
      ),
    );
  }
}
