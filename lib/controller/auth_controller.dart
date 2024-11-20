import 'dart:convert';
import 'package:allwin/controller/retrieve_controller.dart';
import 'package:allwin/controller/token_storage.dart';
import 'package:allwin/pages/onboarding_screen.dart';
import 'package:allwin/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

class AuthController extends GetxController {
  String baseUrl = "https://allwinxpredictions.com";
  RxBool isloading = false.obs;
  final _tokenStorageController = Get.find<TokenStorageController>();
  final _retrieveController = Get.put(RetrieveController());

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
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
        _retrieveController.getUserDetails();
        Get.offAll(() => const BottomNavigation());
      } else {
        MotionToast.error(
          title: const Text("Error"),
          description: Text(
            responseBody["responseBody"].toString(),
          ),
        ).show(context);
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

  Future<void> logout()async{
    await _tokenStorageController.delete();
    Get.offAll(()=> const OnboardingScreen());
  }

}
