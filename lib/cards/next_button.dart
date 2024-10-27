import 'package:flutter/material.dart';


class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffFF6600),
        ),
        child: const Text(
          "Next",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
