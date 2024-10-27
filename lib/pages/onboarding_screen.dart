import 'package:allwin/cards/common_button.dart';
import 'package:allwin/cards/next_button.dart';
import 'package:allwin/intro_screens/intro_page.dart';
import 'package:allwin/intro_screens/intro_page2.dart';
import 'package:allwin/intro_screens/intro_page3.dart';
import 'package:allwin/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  onLastPage = (value == 2);
                });
              },
              controller: _controller,
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            IntroDownWidgets(controller: _controller, onLastPage: onLastPage)
          ],
        ),
      ),
    );
  }
}


class IntroDownWidgets extends StatelessWidget {
  const IntroDownWidgets({
    super.key,
    required PageController controller,
    required this.onLastPage,
  }) : _controller = controller;

  final PageController _controller;
  final bool onLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const SkipButton(),
          CommonButton(
            title: "Skip",
            ontap: () {
              Get.offAll(() => const BottomNavigation());
            },
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Color(0xffFF6600),
            ),
          ),
          onLastPage
              ? CommonButton(
                  title: "Continue",
                  ontap: () {
                    Get.offAll(() => const BottomNavigation());
                  },
                )
              : NextButton(controller: _controller),
        ],
      ),
    );
  }
}

