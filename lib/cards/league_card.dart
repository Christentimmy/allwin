<<<<<<< Updated upstream
import 'package:allwin/cards/each_league_game.dart';
import 'package:allwin/model/get_matches_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class LeagueCard extends StatefulWidget {
  final String title;
  final dynamic subTitle;
  final String leagueImage;
  final List matches;
  final double currentWidth;

  const LeagueCard({
    Key? key,
    required this.currentWidth,
    required this.title,
    required this.subTitle,
    required this.leagueImage,
    required this.matches,
  }) : super(key: key);

  @override
  _LeagueCardState createState() => _LeagueCardState();
}

class _LeagueCardState extends State<LeagueCard> {
  int?
      _expandedIndex; // Track the index of the currently expanded ExpansionTile

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: widget.currentWidth,
        minHeight: 90,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.leagueImage),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          widget.subTitle.toString(),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ],
          ),
          ListView.builder(
            itemCount: widget.matches.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var insiders = widget.matches[index];

              String homeTeam = insiders["home_team"].toString();
              String awayTeam = insiders["away_team"].toString();
              String gameTime = insiders["time"].toString();
              List<String> predictions = (insiders["predictions"] as List)
                  .map((p) => p.toString())
                  .toList();

              return EachLeagueGameCard(
                homeTeamTitle: homeTeam,
                awayTeamTitle: awayTeam,
                gameTime: gameTime,
                awayTeamClubImage: insiders["away_team_img"],
                homeTeamClubImage: insiders["home_team_img"],
                prediction: predictions,
                isExpanded:
                    _expandedIndex == index, // Check if this index is expanded
                onTap: () {
                  setState(() {
                    // Toggle the expansion state
                    _expandedIndex = _expandedIndex == index ? null : index;
                  });
                },
                status: determineStatus(
                    insiders), // Function to determine the status
              );
            },
          ),
        ],
      ),
    );
  }
}
=======

>>>>>>> Stashed changes
