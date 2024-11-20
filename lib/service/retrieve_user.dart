import 'dart:convert';
import 'package:allwin/controller/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RetrieveService {
  String baseUrl = "https://allwinxpredictions.com";
  http.Client client = http.Client();
  final _tokenStorageController = Get.put(TokenStorageController());

  Future<Map<String, dynamic>> getUserDetails() async {
    await _tokenStorageController.getToken();
    String token = _tokenStorageController.token.value;
    if (token.isEmpty) {
      throw Exception("Invalid Token");
    }
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/api/user"),
        headers: {"Authorization": "Bearer $token"},
      );
      final decoded = json.decode(response.body);
      if (decoded["status"] != true) {
        throw Exception(decoded["responseBody"]);
      } else {
        return decoded["responseBody"];
      }
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
