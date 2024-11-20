import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SliderCalender extends StatelessWidget {
  final RxString dateClicked;
  SliderCalender({super.key, required this.dateClicked});

  final RxInt _currentIndex = 2.obs;

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    DateTime today = DateTime.now();
    dateClicked.value = DateFormat("yyyy-MM-dd").format(today);
    return SizedBox(
      height: 60.0,
      width: currentWidth - 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          int offset = index - 2;
          DateTime currentDay = today.add(Duration(days: offset));
          bool isToday = offset == 0;
          return GestureDetector(
            onTap: () {
              dateClicked.value = DateFormat("yyyy-MM-dd").format(currentDay);
              _currentIndex.value = index;
              print(dateClicked);
            },
            child: Obx(
              () => Container(
                width: 60,
                margin: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE').format(currentDay),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: _currentIndex.value == index
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    Text(
                      isToday
                          ? 'Today'
                          : DateFormat('dd MMM').format(currentDay),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: _currentIndex.value == index
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
