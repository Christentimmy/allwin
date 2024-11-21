import 'package:allwin/cards/each_league_game.dart';
import 'package:allwin/cards/league_header_card.dart';
import 'package:allwin/controller/all_request.dart';
import 'package:allwin/controller/calender_controller.dart';
import 'package:allwin/json/all.dart';
import 'package:allwin/model/matches_model.dart';
import 'package:allwin/widgets/calender_row.dart';
import 'package:allwin/widgets/show_matches_home_screen.dart';
import 'package:allwin/widgets/upperwidget_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  void _onButtonPressed() {
    _animationController.repeat();

    _allRequestController.refreshAllGamesButton();

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
        onPressed: () {
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
                   TennisWidget(),
                    // Container(color: Colors.green),
                    BasketBallWidget(),
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

  final _allRequest = Get.put(AllRequestController());

  @override
  Widget build(BuildContext context) {
    print("Footbal Matches: ${_allRequest.allMatchesList.length}");
    return Column(
      children: [
        CalenderRow(
          calenderController: _calenderController,
          dateClciked: dateClicked,
        ),
        const SizedBox(height: 10),
        // ShowMatches(
        //   dateClciked: dateClicked,
        // ),
        ShowMatches(
          dateClciked: dateClicked,
          isChoosenGameLoaded: _allRequest.isMatchesLoaded,
          sportId: "2",
          games: _allRequest.allMatchesList,
          processedMatchesByDate: _allRequest.allMatchesByDate,
        ),
      ],
    );
  }
}

class BasketBallWidget extends StatelessWidget {
  BasketBallWidget({super.key});

  final RxString _dateClicked = "".obs;
  final _calenderController = Get.put(Calender());
  final _allRequest = Get.put(AllRequestController());

  @override
  Widget build(BuildContext context) {
     print("Basket Matches: ${_allRequest.allBasketBallMatches.length}");
    return Column(
      children: [
        CalenderRow(
          dateClciked: _dateClicked,
          calenderController: _calenderController,
        ),
        const SizedBox(height: 10),
        // ElevatedButton(
        //   onPressed: () {
        //     var _allList = _allRequest.allBasketBallMatchesByDate["2024-11-22"];
        //     print(_allList!.length);
        //   },
        //   child: Text("Fetch"),
        // ),
        // ShowBasketBallMatches(
        //   dateClicked: _dateClicked,
        // ),
        ShowMatches(
          dateClciked: _dateClicked,
          isChoosenGameLoaded: _allRequest.isBasketBallMatchesLoaded,
          sportId: "4",
          games: _allRequest.allBasketBallMatches,
          processedMatchesByDate: _allRequest.allBasketBallMatchesByDate,
        ),
      ],
    );
  }
}


class TennisWidget extends StatelessWidget {
  TennisWidget({super.key});

  final RxString _dateClicked = "".obs;
  final _calenderController = Get.put(Calender());

  final _allRequest = Get.put(AllRequestController());

  @override
  Widget build(BuildContext context) {
    print("Tennis Matches: ${_allRequest.allTennisMatches.length}");
    return Column(
      children: [
        CalenderRow(
          dateClciked: _dateClicked,
          calenderController: _calenderController,
        ),
        const SizedBox(height: 10),
        // ElevatedButton(
        //   onPressed: () {
        //     var _allList = _allRequest.allBasketBallMatchesByDate["2024-11-22"];
        //     print(_allList!.length);
        //   },
        //   child: Text("Fetch"),
        // ),
        // ShowBasketBallMatches(
        //   dateClicked: _dateClicked,
        // ),
        ShowMatches(
          dateClciked: _dateClicked,
          isChoosenGameLoaded: _allRequest.isTennisMatchesLoaded,
          sportId: "3",
          games: _allRequest.allTennisMatches,
          processedMatchesByDate: _allRequest.allTennisMatchesByDate,
        ),
      ],
    );
  }
}



class HandBallWidget extends StatelessWidget {
  HandBallWidget({super.key});

  final RxString _dateClicked = "".obs;
  final _calenderController = Get.put(Calender());
  final _allRequest = Get.put(AllRequestController());

  @override
  Widget build(BuildContext context) {
    print("HandBall Matches: ${_allRequest.allTennisMatches.length}");
    return Column(
      children: [
        CalenderRow(
          dateClciked: _dateClicked,
          calenderController: _calenderController,
        ),
        const SizedBox(height: 10),
        ShowMatches(
          dateClciked: _dateClicked,
          isChoosenGameLoaded: _allRequest.isHandBallMatchesLoaded,
          sportId: "5",
          games: _allRequest.allHandBallMatches,
          processedMatchesByDate: _allRequest.allHandBallMatchesByDates,
        ),
      ],
    );
  }
}







class ShowBasketBallMatches extends StatefulWidget {
  final RxString dateClicked;
  const ShowBasketBallMatches({
    super.key,
    required this.dateClicked,
  });

  @override
  State<ShowBasketBallMatches> createState() => _ShowBasketBallMatchesState();
}

class _ShowBasketBallMatchesState extends State<ShowBasketBallMatches> {
  final _allRequest = Get.put(AllRequestController());

  @override
  void initState() {
    super.initState();
    if (!_allRequest.isBasketBallMatchesLoaded.value) {
      // _allRequest.getBasketBallGames(context: context);
      getBasket();
      print("yes");
    }
  }

  void getBasket() async {
    await _allRequest.getDesiredMatch(
      sportId: "4",
      games: _allRequest.allBasketBallMatches,
      processedMatchesByDate: _allRequest.allBasketBallMatchesByDate,
      isVarMatchLoaded: _allRequest.isBasketBallMatchesLoaded.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_allRequest.isloading.value) {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (_allRequest
              .allBasketBallMatchesByDate[widget.dateClicked.value] !=
          null) {
        List<League> leagues =
            _allRequest.allBasketBallMatchesByDate[widget.dateClicked.value]!;
        return Expanded(
          child: ListView.builder(
            itemCount: leagues.length,
            itemBuilder: (context, leagueIndex) {
              final league = leagues[leagueIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeagueHeader(
                    leagueName: league.leagueDetails,
                    leagueImage: leagueImages[league.leagueDetails] ?? "",
                    leagueId: league.leagueId,
                  ),
                  ...league.matches.map((match) {
                    return EachLeagueGameCard(
                      match: match,
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        );
      } else {
        return Expanded(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              Lottie.asset("assets/image/empty2.json", height: 200),
              const Center(
                child: Text(
                  "No matches available for the selected date.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
