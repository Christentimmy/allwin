import 'package:allwin/model/matches_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EachLeagueGameCard extends StatelessWidget {
  final MatchModel match;
  const EachLeagueGameCard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    String imageBasePrefix = "https://allwinxpredictions.com/uploads/teams/";
    DateTime parsedTime = DateFormat("HH:mm:ss").parse(match.time);
    String formattedTime = DateFormat("HH:mm").format(parsedTime);
    // String dateTime = DateFormat("HH:mm").format(DateTime.parse(match.date));
    // IconData statusIcon;
    // Color iconColor;

    // if (status == "win") {
    //   statusIcon = Icons.check_circle;
    //   iconColor = Colors.green;
    // } else if (status == "loss") {
    //   statusIcon = Icons.cancel;
    //   iconColor = Colors.red;
    // } else {
    //   statusIcon = Icons.help;
    //   iconColor = Colors.grey;
    // }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 42, 58),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        horizontalTitleGap: 8,
        leading: Text(
          formattedTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/image/placeholder.png"),
                    image: NetworkImage("$imageBasePrefix${match.homeTeamImg}"),
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  match.homeTeam,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/image/placeholder.png"),
                    image: NetworkImage("$imageBasePrefix${match.awayTeamImg}"),
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  match.awayTeam,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: match.predictions.length == 1
            ? Text(
                match.predictions.join(", "),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            : SizedBox(
                width: 70,
                height: 55,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      match.predictions[0],
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    PopupMenuButton(
                      
                      child: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      itemBuilder: (context) {
                        return match.predictions.map((String predictions) {
                          return PopupMenuItem(child: Text(predictions));
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
