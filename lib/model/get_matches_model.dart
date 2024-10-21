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


class League {
  final String leagueDetails;
  final String leagueId;
  final List<Match> matches;

  League({
    required this.leagueDetails,
    required this.leagueId,
    required this.matches,
  });
}
