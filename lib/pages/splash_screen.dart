import 'package:allwin/controller/all_request.dart';
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

  final _allRequest = Get.put(AllRequestController());

  void navigate() async {
    await Future.delayed(const Duration(seconds: 4)).then((value) async {
      // await _allRequest.getLeagueMatch();
      _allRequest.getDesiredMatch(
        sportId: "2",
        games: _allRequest.allMatchesList,
        processedMatchesByDate: _allRequest.allMatchesByDate,
        isVarMatchLoaded: _allRequest.isMatchesLoaded,
      );
      // await _allRequest.getBasketBallGames(context: context);
      _allRequest.getDesiredMatch(
        sportId: "4",
        games: _allRequest.allBasketBallMatches,
        processedMatchesByDate: _allRequest.allBasketBallMatchesByDate,
        isVarMatchLoaded: _allRequest.isBasketBallMatchesLoaded,
      );

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
