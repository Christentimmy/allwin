import 'package:allwin/Resources/colors.dart';
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
  @override
  void initState() {
    _tokenStorageController.getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (_tokenStorageController.token.value.isEmpty) {
        return LoginScreen();
      }else{
        return const YourDetails();
      }
    });
  }
}

class YourDetails extends StatelessWidget {
  const YourDetails({
    super.key,
  });

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
                onTap: () => Get.to(()=> const  ForgotPassword()),
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
                height: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "null",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Surname Name",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "null",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "null",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
