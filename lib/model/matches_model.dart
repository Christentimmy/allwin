
class MatchModel {
  final int id;
  final String homeTeamImg;
  final String homeTeam;
  final String awayTeamImg;
  final String awayTeam;
  final List<String> predictions;
  final int isPremium;
  final String date;
  final String time;
  final String availablePackages;

  MatchModel({
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

class League {
  final String leagueDetails;
  final int leagueId;
  final List<MatchModel> matches;

  League({
    required this.leagueDetails,
    required this.leagueId,
    required this.matches,
  });
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
