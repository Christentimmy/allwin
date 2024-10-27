import 'package:allwin/controller/calender_controller.dart';
import 'package:allwin/widgets/calender_row.dart';
import 'package:allwin/widgets/show_matches_home_screen.dart';
import 'package:allwin/widgets/upperwidget_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController = Get.put(Calender());
  RxString dateClicked = "".obs;

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const UpperWidgetHomeScreen(),
              const SizedBox(height: 10),
              CalenderRow(
                authController: _authController,
                dateClciked: dateClicked
              ),
              const SizedBox(height: 10),
              ShowMatches(currentWidth: currentWidth, dateClciked: dateClicked),
            ],
          ),
        ),
      ),
    );
  }
}

