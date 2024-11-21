import 'package:allwin/controller/all_request.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class UpperWidgetHomeScreen extends StatefulWidget {
  final PageController pageController;
  const UpperWidgetHomeScreen({
    super.key,
    required this.pageController,
  });

  @override
  State<UpperWidgetHomeScreen> createState() => _UpperWidgetHomeScreenState();
}

class _UpperWidgetHomeScreenState extends State<UpperWidgetHomeScreen> {
  final _allRequestController = Get.put(AllRequestController());
  final RxInt _selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    if (!_allRequestController.isSportCategoryLoaded.value) {
      _allRequestController.getSportCategory();
    }
  }

  RxString selectedSport = 'Football'.obs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/image/logo.png", width: 150),
        Row(
          children: [
            const Icon(Icons.sports, color: Colors.white),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 52, 72).withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedSport.value,
                    dropdownColor:
                        const Color.fromARGB(255, 48, 52, 72).withOpacity(0.9),
                    items: _allRequestController.sportCategoryModelList
                        .map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.name,
                        child: Row(
                          children: [
                            Icon(
                              sportIcons[entry.name]?[0],
                              color: sportIcons[entry.name]?[1],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              entry.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedSport.value = value!;
                      final index = _allRequestController.sportCategoryModelList
                          .indexWhere(
                              (entry) => entry.name == selectedSport.value);
                      if (index != -1) {
                        _selectedIndex.value = index;
                        widget.pageController.jumpToPage(_selectedIndex.value);
                      } else {
                        print("Invalid index");
                      }
                    },
                     
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Map<String, int> sportWithIndex = {
  //   "Football": 0,
  //   "Basketball": 1,
  //   "Tennis": 2,
  //   "Cricket": 3,
  //   "HandBall" : 4,
  //   "Ice Hockey": 5,
  // };

  Map<String, List> sportIcons = {
    "Football": [
      FontAwesomeIcons.futbol,
      Colors.blue,
    ],
    "BasketBall": [
      Icons.sports_basketball,
      Colors.lightGreen,
    ],
    "Tennis": [
      Icons.sports_tennis,
      Colors.pinkAccent,
    ],
    "Cricket": [
      Icons.sports_baseball,
      Colors.purpleAccent,
    ],
    "HandBall": [
      FontAwesomeIcons.baseball,
      Colors.cyanAccent,
    ],
    "Ice Hockey": [
      FontAwesomeIcons.hockeyPuck,
      Colors.lime,
    ],
  };
}
