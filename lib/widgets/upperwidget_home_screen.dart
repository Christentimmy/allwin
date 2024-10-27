import 'package:allwin/json/all.dart';
import 'package:flutter/material.dart';

class UpperWidgetHomeScreen extends StatefulWidget {
  const UpperWidgetHomeScreen({super.key});

  @override
  State<UpperWidgetHomeScreen> createState() => _UpperWidgetHomeScreenState();
}

class _UpperWidgetHomeScreenState extends State<UpperWidgetHomeScreen> {
  String selectedSport = 'Football';
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedSport,
                  dropdownColor:
                      const Color.fromARGB(255, 48, 52, 72).withOpacity(0.9),
                  items: sportsWithIcons.entries.map((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Row(
                        children: [
                          Icon(
                            entry.value['icon'],
                            color: entry.value['color'],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            entry.key,
                            style: const TextStyle(
                              color: Colors.white,
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
                    color: Colors.white,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}