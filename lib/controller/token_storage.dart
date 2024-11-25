import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageController extends GetxController {
  RxString token = "".obs;

  void saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString("token") ?? "";
  }

  Future<void> delete()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
  }
  
}
