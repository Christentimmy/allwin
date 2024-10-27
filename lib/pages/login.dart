import 'package:allwin/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Resources/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passowordController = TextEditingController();
  final _authController = Get.put(AuthController());

  // void loginUser() async {
  //   await _authController.login(
  //     email: _emailController.text.trim(),
  //     password: _passowordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Login Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.only(right: 7),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/image/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      controller: _passowordController,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0, top: 4),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        await _authController.login(
                          email: _emailController.text.trim(),
                          password: _passowordController.text,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                color: Color.fromARGB(103, 255, 102, 0),
                                blurRadius: 5,
                                spreadRadius: 2,
                              )
                            ]),
                        child: _authController.isloading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () async {
                          const url = 'https://allwinxpredictions.com/register';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Text(
                          "Sign Up ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
