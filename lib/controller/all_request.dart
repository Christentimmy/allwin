import 'dart:convert';
import 'package:allwin/model/booking_model.dart';
import 'package:allwin/model/get_matches_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllRequestController extends GetxController {
  var isloading = false.obs;
  var isBookingLoading = false.obs;
  var isMatchesLoaded = false.obs;
  var isBookingLoaded = false.obs;
  var allMatchesList = [].obs;
  var allMatchesByDate = <String, List<League>>{}.obs;
  String baseUrl = "https://allwinxpredictions.com";
  RxList<BookingModel> bookingCodeList = <BookingModel>[].obs;

  Future<void> getLeagueMatch() async {
    isloading.value = true;
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/get-matches/2"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var decode = json.decode(response.body);
        var responseBody = decode["responseBody"];
        allMatchesList.value = responseBody;
        processMatchesByDate(allMatchesList);
        isMatchesLoaded.value = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void processMatchesByDate(List<dynamic> games) {
    allMatchesByDate.clear(); 
    for (var leagueData in games) {
      String leagueDetails = leagueData["league_details"];
      int leagueId = leagueData["league_id"];
      List matches = leagueData["matches"];

      for (var matchData in matches) {
        String date = matchData["date"];

        // Construct Match object
        MatchModel match = MatchModel(
          id: matchData["id"],
          homeTeamImg: matchData["home_team_img"],
          homeTeam: matchData["home_team"],
          awayTeamImg: matchData["away_team_img"],
          awayTeam: matchData["away_team"],
          predictions: List<String>.from(matchData["predictions"]),
          isPremium: matchData["is_premium"],
          date: date,
          time: matchData["time"],
          availablePackages: matchData["available_packages"],
        );


        if (allMatchesByDate.containsKey(date)) {
          var leaguesForDate = allMatchesByDate[date]!;
          League? existingLeague = leaguesForDate.firstWhereOrNull(
            (league) => league.leagueId == leagueId,
          );

          if (existingLeague != null) {
            existingLeague.matches.add(match);
          } else {
            leaguesForDate.add(
              League(
                leagueDetails: leagueDetails,
                leagueId: leagueId,
                matches: [match],
              ),
            );
          }
        } else {
          allMatchesByDate[date] = [
            League(
              leagueDetails: leagueDetails,
              leagueId: leagueId,
              matches: [match],
            ),
          ];
        }
      }
    }

    isloading.value = false;
  }

  Future<void> getBookingCodes() async {
    isBookingLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/get-bookings"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var responseBody = json.decode(response.body);
      if (responseBody["status"] == true) {
        List codes = responseBody["responseBody"];
        List<BookingModel> neededMap =
            codes.map((element) => BookingModel.fromJson(element)).toList();
        bookingCodeList.value = neededMap;
        isBookingLoaded.value = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isBookingLoading.value = false;
    }
  }
}
