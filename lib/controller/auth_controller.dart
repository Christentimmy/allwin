import 'dart:convert';
import 'package:allwin/controller/token_storage.dart';
import 'package:allwin/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String baseUrl = "https://allwinxpredictions.com";
  RxBool isloading = false.obs;
  final _tokenStorageController = Get.find<TokenStorageController>();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    isloading.value = true;
    try {
      final response = await http.post(
          Uri.parse(
            "$baseUrl/api/login",
          ),
          body: {
            "email": email,
            "password": password,
          });
      final responseBody = json.decode(response.body);
      if (responseBody["status"] == true) {
        String newToken = responseBody["responseBody"]["token"];
        _tokenStorageController.saveToken(newToken);
        Get.offAll(() => const BottomNavigation());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    isloading.value = true;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/login"),
        headers: {
          "Content-type": "application/json",
        },
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {}
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
