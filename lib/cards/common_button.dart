import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const CommonButton({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffFF6600),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
