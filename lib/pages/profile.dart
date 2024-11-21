import 'dart:ui';

import 'package:allwin/Resources/colors.dart';
import 'package:allwin/controller/auth_controller.dart';
import 'package:allwin/controller/retrieve_controller.dart';
import 'package:allwin/controller/token_storage.dart';
import 'package:allwin/pages/forgot_password.dart';
import 'package:allwin/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _tokenStorageController = Get.put(TokenStorageController());
  final _retrieveController = Get.put(RetrieveController());
  @override
  void initState() {
    _tokenStorageController.getToken();
    _retrieveController.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_tokenStorageController.token.value.isEmpty) {
        return LoginScreen();
      } else {
        return YourDetails();
      }
    });
  }
}

class YourDetails extends StatelessWidget {
  YourDetails({
    super.key,
  });

  final _authController = Get.put(AuthController());
  final _retrieveController = Get.put(RetrieveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF060C1F),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            color: AppColors.primaryColor,
            iconColor: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => Get.to(() => const ForgotPassword()),
                child: const Row(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                child: Row(
                  children: [
                    Text(
                      "Change Profile Avater",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 13,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 125,
                      height: 125,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: AppColors.secondaryColor,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/image/avater.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 110,
                    bottom: 95,
                    child: Image.asset(
                      "assets/image/premium-pack.png",
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 120,
                height: 30,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: const Text(
                  "VIP Premium",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: Get.height * 0.323,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/image/blue.jpg",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(234, 0, 0, 0),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "First Name",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  _retrieveController.userDetails.value?.name ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  _retrieveController
                                          .userDetails.value?.email ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Status",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  _retrieveController
                                          .userDetails.value?.status ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: () async {
                    await _authController.logout();
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
