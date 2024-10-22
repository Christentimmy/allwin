import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class EachLeagueGameCard extends StatelessWidget {
  final String homeTeamTitle;
  final String awayTeamTitle;
  final List<String> prediction;
  final String homeTeamClubImage;
  final String awayTeamClubImage;
  final String gameTime;
  final bool isExpanded; // Track if this card is expanded
  final VoidCallback onTap; // Callback for tap events

  const EachLeagueGameCard({
    Key? key,
    required this.homeTeamTitle,
    required this.awayTeamTitle,
    required this.prediction,
    required this.homeTeamClubImage,
    required this.awayTeamClubImage,
    required this.gameTime,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 42, 58),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: onTap, // Trigger the onTap when the card is tapped
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeTeamTitle,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    awayTeamTitle,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                gameTime,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          leading: badges.Badge(
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "View",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ],
          ),
          children: isExpanded
              ? [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 52, 72),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: prediction.map((pred) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            pred,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]
              : [],
          onExpansionChanged: (isExpanded) {
            // Handle expansion change
            if (isExpanded) {
              onTap(); // Call the tap callback when expanded
            }
          },
        ),
      ),
    );
  }
}
