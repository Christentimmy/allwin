class Match {
  final int id;
  final String homeTeamImg;
  final String homeTeam;
  final String awayTeamImg;
  final String awayTeam;
  final List<String> predictions;
  final bool isPremium;
  final String date;
  final String time;
  final List<String> availablePackages;

  Match({
    required this.id,
    required this.homeTeamImg,
    required this.homeTeam,
    required this.awayTeamImg,
    required this.awayTeam,
    required this.predictions,
    required this.isPremium,
    required this.date,
    required this.time,
    required this.availablePackages,
  });
}

<<<<<<< Updated upstream
=======

// class League {
//   final String leagueDetails;
//   final String leagueId;
//   final List<Match> matches;

//   League({
//     required this.leagueDetails,
//     required this.leagueId,
//     required this.matches,
//   });
// }


>>>>>>> Stashed changes
class League {
  final String leagueDetails;
  final int leagueId;
  final Map<String, List<Match>> matchesByDate;

  League({
    required this.leagueDetails,
    required this.leagueId,
    required this.matchesByDate,
  });
<<<<<<< Updated upstream
}

String determineStatus(Map<String, dynamic> insiders) {
  // Add your logic here to determine the game status
  // For example:
  if (insiders["game_result"] == "win") {
    return "win"; // Game is a win
  } else if (insiders["game_result"] == "loss") {
    return "loss"; // Game is a loss
  } else {
    return "process"; // Game is still in process
  }
}
=======
}
>>>>>>> Stashed changes
