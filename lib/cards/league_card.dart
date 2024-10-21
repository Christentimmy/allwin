import 'package:allwin/cards/each_league_game.dart';
import 'package:flutter/material.dart';

class LeagueCard extends StatelessWidget {
  final String title;
  final subTitle;
  final String leagueImage;
  final List matches;
  const LeagueCard({
    super.key,
    required this.currentWidth,
    required this.title,
    required this.subTitle,
    required this.leagueImage,
    required this.matches,
  });

  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: currentWidth,
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
                          image: AssetImage(leagueImage),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          subTitle.toString(),
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
            // itemCount: matches.length,
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index1) {
              // final games = gamesInsideLeague[index];
              var insiders = matches[index1];
              String homeTeam = insiders["home_team"];
              String awayTeam = insiders["away_team"];
              return EachLeagueGameCard(
                homeTeamTitle: homeTeam,
                awayTeamTitle: awayTeam,
                gameTime: insiders["time"],
                awayTeamClubImage: insiders["away_team_img"],
                homeTeamClubmImage: insiders["home_team_img"],
                prediction: insiders["predictions"],
              );
            },
          ),
          //gamesssssssssss
        ],
      ),
    );
  }
}
