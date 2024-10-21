import 'package:allwin/json/all.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<bool> isCategoryExpanded =
      List.generate(sportCategory.length, (index) => false);

  List<List<String>> innerList = [
    [
      "Champions league",
      "Premier league",
      "Laliga",
      "Laliga 1",
      "Serie A",
      "Bundesliga",
      "Premiership",
      "Saudi pro league",
    ],
    [
      "Test",
    ],
    [
      "NBA Regular Season League",
      "BBL Germany",
      "Liga ACB Spain",
      "CBA China",
      "NBB Brazil",
      "LKL Lithuania",
      "Euroleague Regular Season",
      "Lega Basket Serie A",
      "LNB Pro A",
    ],
    [
      "Test",
    ],
    ["Test"],
  ];

  bool isArrowDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Popular Events",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff283968),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: sportCategory.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              isCategoryExpanded[index] =
                                  !isCategoryExpanded[index];
                                isArrowDown = !isArrowDown;  
                            });
                          },
                          leading: FaIcon(
                            sportCategory[index][0],
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Text(
                            sportCategory[index][1],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: isArrowDown ? const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 15,
                            color: Colors.white,
                          ) : const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        if (isCategoryExpanded[index])
                          Column(
                            children: innerList[index].map((item) {
                              return ListTile(
                                title: Text(
                                  item,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                // Add additional properties as needed
                              );
                            }).toList(),  
                          ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
