import 'package:allwin/cards/league_card.dart';
import 'package:allwin/controller/all_request.dart';
import 'package:allwin/controller/auth_controller.dart';
import 'package:allwin/widgets/calender_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController = Get.put(Calender());

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
              Image.asset("assets/image/logo.png", width: 150),
              const SizedBox(height: 10),
              // const SportCategoryCard(),
              CalenderRow(authController: _authController),
              const SizedBox(height: 10),
              ShowMatches(currentWidth: currentWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowMatches extends StatefulWidget {
  const ShowMatches({
    super.key,
    required this.currentWidth,
  });

  final double currentWidth;

  @override
  State<ShowMatches> createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches> {
  final _allMatches = Get.put(AllRequestController());
  @override
  void initState() {
    super.initState();
    if (!_allMatches.isMatchesLoaded.value) {
      print("object");
      _allMatches.getLeagueMatch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _allMatches.isloading.value
          ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : Expanded(child: Obx(() {
              return ListView.builder(
                itemCount: _allMatches.allMatchesList.length,
                itemBuilder: (context, index) {
                  final items = _allMatches.allMatchesList[index];
                  List matches = items["matches"];
                  print(matches.length);
                  return LeagueCard(
                    matches: items["matches"],
                    currentWidth: widget.currentWidth,
                    title: items["league_details"],
                    subTitle: items["league_id"],
                    // leagueImage: (items["league_details"]) == "Premier League" ? item[0]["image_icon"] : "",
                    leagueImage: "assets/image/pl.jpg",
                  );
                },
              );
            })),
    );
  }
}
