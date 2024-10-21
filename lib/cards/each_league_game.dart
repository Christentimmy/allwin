import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class EachLeagueGameCard extends StatelessWidget {
  final String homeTeamTitle;
  final String awayTeamTitle;
  final List prediction;
  final String homeTeamClubmImage;
  final String awayTeamClubImage;
  // final String badgeText;
  final String gameTime;
  // final IconData status;
  const EachLeagueGameCard({
    super.key,
    required this.homeTeamTitle,
    required this.awayTeamTitle,
    required this.prediction,
    required this.homeTeamClubmImage,
    required this.awayTeamClubImage,
    // required this.badgeText,
    required this.gameTime,
    // required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 42, 58),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.square,
                borderRadius: BorderRadius.circular(5),
                padding: const EdgeInsets.all(2),
                badgeGradient: const badges.BadgeGradient.linear(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              position: badges.BadgePosition.topEnd(top: -12, end: -20),
              badgeContent: const Text(
                "Paid",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              gameTime,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        title: SizedBox(
          width: 295,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeTeamTitle,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),

              // Row(
              //   children: [
              //     FadeInImage.assetNetwork(
              //       placeholder: 'assets/image/placeholder.png',
              //       image:
              //           "https://allwinxpredictions.com/uploads/teams/$homeTeamClubmImage",
              //       width: 20,
              //       height: 20,
              //     ),
              //     const SizedBox(width: 5),
              //     Text(
              //       homeTeamTitle,
              //       style: const TextStyle(
              //         color: Colors.white60,
              //         fontSize: 13,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 6),
              Text(
                awayTeamTitle,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),
              // Row(
              //   children: [
              //     FadeInImage.assetNetwork(
              //       placeholder: 'assets/image/placeholder.png',
              //       image:
              //           "https://allwinxpredictions.com/uploads/teams/$awayTeamClubImage",
              //       width: 20,
              //       height: 20,
              //     ),

              //     const SizedBox(width: 5),
              //     Text(
              //       awayTeamTitle,
              //       style: const TextStyle(
              //         color: Colors.white60,
              //         fontSize: 13,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        trailing: prediction.length == 1
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  prediction[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              )
            : Container(
                height: 45,
                constraints: const BoxConstraints(
                  maxWidth: 45,
                ),
                child: ListView.builder(
                  itemCount: prediction.length,
                  itemBuilder: (context, index) {
                    String allPred = "";
                    allPred = "${allPred + prediction[index]},";
                    return Text(
                      allPred,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
