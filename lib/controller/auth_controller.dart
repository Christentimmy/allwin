import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calender extends GetxController {
  showCalender(BuildContext context) {
    showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(305, 370),
      dialogBackgroundColor: const Color(0xff283968),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.white,
            dialogBackgroundColor: const Color(0xff283968),
            // colorScheme: ColorScheme(
            //   background: const Color(0xff283968),
            // ),
          ),
          child: child!,
        );
      },
    );
  }
}
