import 'dart:convert';
import 'package:allwin/model/booking_model.dart';
import 'package:allwin/model/matches_model.dart';
import 'package:allwin/model/sport_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

class AllRequestController extends GetxController {
  //general loading
  var isloading = false.obs;

  //Booking codes
  var isBookingLoading = false.obs;
  var isBookingLoaded = false.obs;
  RxList<BookingModel> bookingCodeList = <BookingModel>[].obs;

  //football
  var isMatchesLoaded = false.obs;
  var allMatchesList = [].obs;
  var allMatchesByDate = <String, List<League>>{}.obs;

  //sport category
  RxBool isSportCategoryLoaded = false.obs;
  RxList<SportCategoryModel> sportCategoryModelList =
      <SportCategoryModel>[].obs;

  //Basketball Matches
  var allBasketBallMatches = [].obs;
  var allBasketBallMatchesByDate = <String, List<League>>{}.obs;
  var isBasketBallMatchesLoaded = false.obs;

  //base Url
  String baseUrl = "https://allwinxpredictions.com";

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
        await processMatchesByDate(allMatchesList, allMatchesByDate);
        isMatchesLoaded.value = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> processMatchesByDate(List<dynamic> games,
      RxMap<String, List<League>> processedMatchesByDate) async {
    processedMatchesByDate.clear();

    for (var leagueData in games) {
      String leagueDetails = leagueData["league_details"] ?? "Unknown League";
      int leagueId = leagueData["league_id"] ?? 0;
      List matches = leagueData["matches"] ?? [];

      for (var matchData in matches) {
        String date = matchData["date"] ?? "Unknown Date";

        MatchModel match = MatchModel(
          id: matchData["id"] ?? 0,
          homeTeamImg: matchData["home_team_img"] ?? "",
          homeTeam: matchData["home_team"] ?? "Unknown Team",
          awayTeamImg: matchData["away_team_img"] ?? "",
          awayTeam: matchData["away_team"] ?? "Unknown Team",
          predictions: List<String>.from(matchData["predictions"] ?? []),
          isPremium: matchData["is_premium"] ?? false,
          date: date,
          time: matchData["time"] ?? "00:00",
          availablePackages: matchData["available_packages"] ?? [],
        );

        // If the date already exists in processedMatchesByDate, add the match to the appropriate league
        if (processedMatchesByDate.containsKey(date)) {
          var leaguesForDate = processedMatchesByDate[date]!;

          // Find if the league already exists for the date
          League? existingLeague = leaguesForDate.firstWhereOrNull(
            (league) => league.leagueId == leagueId,
          );

          if (existingLeague != null) {
            existingLeague.matches
                .add(match); // Add the match to the existing league
          } else {
            leaguesForDate.add(
              League(
                leagueDetails: leagueDetails,
                leagueId: leagueId,
                matches: [match],
              ),
            ); // Create a new league for this match
          }
        } else {
          // If the date doesn't exist yet, create a new entry for this date
          processedMatchesByDate[date] = [
            League(
              leagueDetails: leagueDetails,
              leagueId: leagueId,
              matches: [match],
            ),
          ];
        }
      }
    }
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

  Future<void> getSportCategory() async {
    isloading.value = true;
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/get-sport-category"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] != true) {
        Get.snackbar("Error", decodedResponse["responseMessage"]);
        return;
      } else {
        List allSports = decodedResponse["responseBody"];
        List<SportCategoryModel> neededMap = allSports
            .map((element) => SportCategoryModel.fromJson(element))
            .toList();
        sportCategoryModelList.value = neededMap;
        isSportCategoryLoaded.value = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> getBasketBallGames({
    required BuildContext context,
  }) async {
    isloading.value = true;
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/get-matches/4"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final decoded = json.decode(response.body);
      if (decoded["status"] != true) {
        MotionToast.error(
          title: const Text("Error"),
          description: Text(
            decoded["responseBody"],
          ),
        ).show(context);
      } else {
        var decode = json.decode(response.body);
        var responseBody = decode["responseBody"];
        allBasketBallMatches.value = responseBody;
        
        processMatchesByDate(
          allBasketBallMatches,
          allBasketBallMatchesByDate,
        );
        
        isMatchesLoaded.value = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
