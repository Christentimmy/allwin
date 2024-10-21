

import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      color: const Color(0xFF060C1F),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.asset("assets/image/int1.png", width: 300),
          const Text(
            "Expert Predictions",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Text(
            "Our team of seasoned analysts provides reliable predictions to help you make informed betting decisions.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}