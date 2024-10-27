import 'package:allwin/cards/each_league_game.dart';
import 'package:allwin/cards/league_header_card.dart';
import 'package:allwin/controller/all_request.dart';
import 'package:allwin/json/all.dart';
import 'package:allwin/model/get_matches_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMatches extends StatefulWidget {
  final RxString dateClciked;
  const ShowMatches({
    super.key,
    required this.currentWidth,
    required this.dateClciked,
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
      _allMatches.getLeagueMatch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_allMatches.isloading.value) {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (_allMatches.allMatchesByDate[widget.dateClciked.value] !=
          null) {
        List<League> leagues =
            _allMatches.allMatchesByDate[widget.dateClciked.value]!;
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
        return const Expanded(
          child: Center(
            child: Text(
              "No matches available for the selected date.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    });
  }
}
