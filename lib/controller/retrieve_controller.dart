import 'package:allwin/controller/token_storage.dart';
import 'package:allwin/model/retrieve_model.dart';
import 'package:allwin/service/retrieve_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class RetrieveController extends GetxController {
  String baseUrl = "https://allwinxpredictions.com";
  final _tokenStorageController = Get.put(TokenStorageController());
  final _retrievService = Get.put(RetrieveService());
  Rxn<RetrieveModel> userDetails = Rxn<RetrieveModel>();

  Future<void> getUserDetails() async {
    await _tokenStorageController.getToken();
    final token = _tokenStorageController.token.value;
    if (token.isEmpty) {
      return;
    }
    try {
      final response = await _retrievService.getUserDetails();
      if (response.isEmpty) {
        return;
      }
      final instance = RetrieveModel.fromJson(response["user"]);
      userDetails.value = instance;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
