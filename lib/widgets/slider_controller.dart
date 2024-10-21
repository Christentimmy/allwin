import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SliderCalender extends StatelessWidget {
  const SliderCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 60.0,
      width: currentWidth - 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          int offset = index - 2;
          DateTime today = DateTime.now();
          DateTime currentDay = today.add(Duration(days: offset));

          bool isToday = offset == 0;

          return Container(
            width: 55,
            margin: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('EEE').format(currentDay),
                  style: TextStyle(
                      fontSize: 12.0,
                      color: isToday ? Colors.white : Colors.white60),
                ),
                const SizedBox(height: 2.0),
                Text(
                  isToday ? 'Today' : DateFormat('dd MMM').format(currentDay),
                  style: TextStyle(
                      fontSize: 10.0,
                      color: isToday ? Colors.white : Colors.white60),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
