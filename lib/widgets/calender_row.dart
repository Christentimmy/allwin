
import 'package:allwin/controller/auth_controller.dart';
import 'package:allwin/widgets/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalenderRow extends StatelessWidget {
  const CalenderRow({
    super.key,
    required Calender authController,
  }) : _authController = authController;

  final Calender _authController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SliderCalender(),
        GestureDetector(
          onTap: () {
            _authController.showCalender(context);
          },
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            width: 50,
            height: 50,
            child: const FaIcon(
              FontAwesomeIcons.calendar,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}


