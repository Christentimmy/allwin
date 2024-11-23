import 'package:allwin/cards/each_league_game.dart';
import 'package:allwin/cards/league_header_card.dart';
import 'package:allwin/controller/all_request.dart';
import 'package:allwin/json/all.dart';
import 'package:allwin/model/matches_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ShowMatches extends StatefulWidget {
  final RxString dateClciked;
  final RxBool isChoosenGameLoaded;
  final String sportId;
  final RxList<dynamic> games;
  final RxMap<String, List<League>> processedMatchesByDate;
  const ShowMatches({
    super.key,
    required this.dateClciked,
    required this.isChoosenGameLoaded,
    required this.sportId,
    required this.games,
    required this.processedMatchesByDate,
  });

  @override
  State<ShowMatches> createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches> {
  final _allRequest = Get.put(AllRequestController());

  @override
  void initState() {
    super.initState();
    if (!widget.isChoosenGameLoaded.value) {
      // _allRequest.getLeagueMatch()
      // _allRequest.getDesiredMatch(
      //   sportId: "2",
      //   games: _allRequest.allMatchesList,
      //   processedMatchesByDate: _allRequest.allMatchesByDate,
      //   isVarMatchLoaded: _allRequest.isMatchesLoaded.value,
      // );

      _allRequest.getDesiredMatch(
        sportId: widget.sportId,
        games: widget.games,
        processedMatchesByDate: widget.processedMatchesByDate,
        isVarMatchLoaded: widget.isChoosenGameLoaded,
      );
    }
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
      } else if (widget.processedMatchesByDate[widget.dateClciked.value] !=
          null) {
        List<League> leagues =
            widget.processedMatchesByDate[widget.dateClciked.value]!;
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
