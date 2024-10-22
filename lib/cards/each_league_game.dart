import 'package:flutter/material.dart';

class EachLeagueGameCard extends StatelessWidget {
  final String homeTeamTitle;
  final String awayTeamTitle;
  final List<String> prediction;
  final String homeTeamClubImage;
  final String awayTeamClubImage;
  final String gameTime;
  final bool isExpanded; // Track if this card is expanded
  final VoidCallback onTap; // Callback for tap events
  final String status; // New parameter for win/loss status

  const EachLeagueGameCard({
    super.key,
    required this.homeTeamTitle,
    required this.awayTeamTitle,
    required this.prediction,
    required this.homeTeamClubImage,
    required this.awayTeamClubImage,
    required this.gameTime,
    required this.isExpanded,
    required this.onTap,
    required this.status, // Initialize the status
  });

  @override
  Widget build(BuildContext context) {
    // Determine the icon based on the status
    IconData statusIcon;
    Color iconColor;

    if (status == "win") {
      statusIcon = Icons.check_circle; // Icon for win
      iconColor = Colors.green; // Green color for win
    } else if (status == "loss") {
      statusIcon = Icons.cancel; // Icon for loss
      iconColor = Colors.red; // Red color for loss
    } else {
      statusIcon = Icons.help; // Default icon if status is not set
      iconColor = Colors.grey; // Default color
    }

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
          leading: Icon(
            statusIcon,
            color: iconColor,
            size: 24,
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
