import 'package:allwin/Resources/colors.dart';
import 'package:allwin/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF060C1F),
        title: const Text(
          "Choose Package",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PremiumCard(
                  currentWidth: currentWidth,
                  cardTitle: "Premium Plan",
                  price: 299,
                ),
                PremiumCard(
                  currentWidth: currentWidth,
                  cardTitle: 'VIP Premium',
                  price: 599,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final String cardTitle;
  final int price;
  const PremiumCard({
    super.key,
    required this.currentWidth,
    required this.cardTitle,
    required this.price,
  });

  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(()=> const SignUpScreen());
        },
        child: Container(
          width: currentWidth / 1.5,
          height: 280,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(-15, -20),
                blurRadius: 1,
                spreadRadius: 2,
                color: Color.fromARGB(24, 255, 255, 255),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(216, 255, 255, 255),
          ),
          child: Column(
            children: [
              Image.asset("assets/image/premium-pack.png", width: 50),
              Text(
                cardTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Qui quas nulla ",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₦$price ",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const Text(
                    "/ ",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const Text("month"),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 150,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        color: Color.fromARGB(34, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]),
                child: const Text(
                  "Add subscription",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
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
