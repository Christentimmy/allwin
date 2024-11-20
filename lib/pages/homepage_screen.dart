import 'package:allwin/controller/all_request.dart';
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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _allRequestController = Get.put(AllRequestController());
  final _pageController = PageController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600), // Duration of the rotation
    );
  }

  void _onButtonPressed() {
    _animationController.repeat();

    _allRequestController.getLeagueMatch(); 
    
    Future.delayed(const Duration(milliseconds: 1200), () {
      _animationController.stop();
      _animationController.reset();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _onButtonPressed();
        },
        child: RotationTransition(
        turns: _animationController,
        child: const Icon(Icons.refresh),
      ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              UpperWidgetHomeScreen(
                pageController: _pageController,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    FootballWidget(),
                    BasketBallWidget(),
                    Container(color: Colors.red),
                    Container(color: Colors.blue),
                    Container(color: Colors.amber),
                    Container(color: Colors.deepPurpleAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FootballWidget extends StatelessWidget {
  FootballWidget({
    super.key,
  });

  final RxString dateClicked = "".obs;
  final _calenderController = Get.put(Calender());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderRow(
          calenderController: _calenderController,
          dateClciked: dateClicked,
        ),
        const SizedBox(height: 10),
        ShowMatches(
          currentWidth: Get.width,
          dateClciked: dateClicked,
        ),
      ],
    );
  }
}

class BasketBallWidget extends StatelessWidget {
  BasketBallWidget({super.key});

  final RxString _dateClicked = "".obs;
  final _calenderController = Get.put(Calender());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderRow(
          dateClciked: _dateClicked,
          calenderController: _calenderController,
        ),
      ],
    );
  }
}
