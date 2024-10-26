import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllRequestController extends GetxController {
  RxBool isloading = false.obs;
  var allMatchesList = [].obs;
  String baseUrl = "https://allwinxpredictions.com";
  RxBool isMatchesLoaded = false.obs;

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
      }
      isMatchesLoaded.value = true;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
