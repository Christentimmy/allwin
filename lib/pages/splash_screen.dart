import 'package:allwin/controller/all_request.dart';
import 'package:allwin/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    Future.delayed(const Duration(seconds: 4)).then((value) async {
      // await _allRequest.getLeagueMatch();
      _allRequest.getDesiredMatch(
        sportId: "2",
        games: _allRequest.allMatchesList,
        processedMatchesByDate: _allRequest.allMatchesByDate,
        isVarMatchLoaded: _allRequest.isMatchesLoaded,
      );
      _allRequest.getDesiredMatch(
        sportId: "4",
        games: _allRequest.allBasketBallMatches,
        processedMatchesByDate: _allRequest.allBasketBallMatchesByDate,
        isVarMatchLoaded: _allRequest.isBasketBallMatchesLoaded,
      );

      checkUserStatus();
    });
  }


  void checkUserStatus()async{
    final prefs = await SharedPreferences.getInstance();
    final bool hasSeenOnboaring = prefs.getBool("hasSeenOnboarding") ?? false;

    if (hasSeenOnboaring) {
      Get.to(()=> BottomNavigation());
    }else{
      Get.to(()=> OnboardingScreen());
    }
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
