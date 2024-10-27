import 'package:flutter/material.dart';

class LeagueHeader extends StatelessWidget {
  final String leagueName;
  final String leagueImage;
  final int leagueId;

  const LeagueHeader({
    super.key,
    required this.leagueName,
    required this.leagueImage,
    required this.leagueId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(leagueImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leagueName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              leagueId.toString(),
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 11,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
        ),
      ],
    );
  }
}


