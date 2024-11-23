import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ALLWINXPREDICTIONS GUIDE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                """ ALLWINXPREDICTIONS is a Prediction website designed for Sport, Sport-bet lovers, and Sport- news lovers. It contains some features and pages which enables the users to enjoy their time spent on the website, it includes sport news page, predictions page, customer support and Telegram channels for daily and weekly bookings drops.
        ALLWINXPREDICTIONS predicted games are now free and all accessible freely from each users end with easy and descriptive navigation plus fast response.
        Our predictions are thoroughly screened and well analyzed based on their last and previous performance on each matches.
        FEATURES AND FUNCTIONALITIES
        For Football, here are the meaning to some of our prediction codes;
        0.5 ->> 1 goal
        1.5 ->> 2 goals
        2.5 ->> 3 goals
        H - 0.5 ->> Home 1 goal
        H - 1.5 ->> Home 2 goals
        A - 0.5 ->> Away 1 goal
        A - 1.5 ->> Away 2 goals
        For Basketball;
        141 - 146 means you can chose any points from 141, 142, 143, 144 and from 145 to 146 is risky but also have high possibilities of coming home. Anything above 146 has high chances of losing and not guaranteed!
        Same formula applies to every other codes on basketball, follow that formula to enjoy more games success! """,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
