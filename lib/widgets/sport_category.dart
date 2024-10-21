
import 'package:allwin/json/all.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SportCategoryCard extends StatefulWidget {
  const SportCategoryCard({super.key});

  @override
  State<SportCategoryCard> createState() => _SportCategoryCardState();
}

class _SportCategoryCardState extends State<SportCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var i = 0; i < sportCategory.length; i++) {
                  sportCategory[i][2] = false;
                }
                sportCategory[index][2] = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 130,
              decoration: BoxDecoration(
                color: const Color(0xff4C546A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    sportCategory[index][0],
                    size: 20,
                    color: sportCategory[index][2]
                        ? const Color(0xffFF6600)
                        : Colors.white,
                  ),
                  Text(
                    sportCategory[index][1],
                    style: TextStyle(
                      fontSize: 17,
                      color: sportCategory[index][2]
                          ? const Color(0xffFF6600)
                          : Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
