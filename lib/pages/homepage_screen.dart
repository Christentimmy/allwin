import 'package:allwin/cards/league_card.dart';
import 'package:allwin/controller/all_request.dart';
import 'package:allwin/controller/auth_controller.dart';
import 'package:allwin/widgets/calender_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController = Get.put(Calender());

  // Define the list of sports with corresponding icons and colors
  final Map<String, Map<String, dynamic>> sportsWithIcons = {
    'Football': {
      'icon': Icons.sports_football,
      'color': Colors.green, // Football icon color
    },
    'Basketball': {
      'icon': Icons.sports_basketball,
      'color': Colors.orange, // Basketball icon color
    },
    'Tennis': {
      'icon': Icons.sports_tennis,
      'color': Colors.blue, // Tennis icon color
    },
    'Cricket': {
      'icon': Icons.sports_baseball, // Substitute for cricket
      'color': Colors.brown, // Cricket icon color
    },
  };

  String selectedSport = 'Football'; // Default selected sport

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/image/logo.png", width: 150),
                  // Badge-style DropdownButton for selecting sport activity view
                  Row(
                    children: [
                      const Icon(Icons.sports,
                          color: Colors.white), // General sports icon
                      const SizedBox(
                          width: 8), // Spacing between icon and dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4), // Adjusted padding
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 48, 52, 72).withOpacity(
                              0.8), // Background color with opacity
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSport,
                            dropdownColor: Color.fromARGB(255, 48, 52, 72)
                                .withOpacity(
                                    0.9), // Dropdown menu color with opacity
                            items: sportsWithIcons.entries.map((entry) {
                              return DropdownMenuItem<String>(
                                value: entry.key,
                                child: Row(
                                  children: [
                                    Icon(
                                      entry.value['icon'],
                                      color: entry.value[
                                          'color'], // Sport-specific icon color
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Spacing between icon and text
                                    Text(
                                      entry.key,
                                      style: const TextStyle(
                                        color: Colors.white, // Text color
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedSport = newValue!;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white, // Icon color
                            ),
                            style: const TextStyle(
                                color: Colors.white), // Dropdown text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // const SportCategoryCard(),
              CalenderRow(authController: _authController),
              const SizedBox(height: 10),
              ShowMatches(currentWidth: currentWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowMatches extends StatefulWidget {
  const ShowMatches({
    super.key,
    required this.currentWidth,
  });

  final double currentWidth;

  @override
  State<ShowMatches> createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches> {
  final _allMatches = Get.put(AllRequestController());
  @override
  void initState() {
    super.initState();
    if (!_allMatches.isMatchesLoaded.value) {
      print("object");
      _allMatches.getLeagueMatch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _allMatches.isloading.value
          ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : Expanded(child: Obx(() {
              return ListView.builder(
                itemCount: _allMatches.allMatchesList.length,
                itemBuilder: (context, index) {
                  final items = _allMatches.allMatchesList[index];
                  List matches = items["matches"];
                  print(matches.length);
                  return LeagueCard(
                    matches: items["matches"],
                    currentWidth: widget.currentWidth,
                    title: items["league_details"],
                    subTitle: items["league_id"],
                    // leagueImage: (items["league_details"]) == "Premier League" ? item[0]["image_icon"] : "",
                    leagueImage: "assets/image/pl.jpg",
                  );
                },
              );
            })),
    );
  }
}
