import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingCodeScreen extends StatelessWidget {
  const BookingCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Booking Code",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 11, 36),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xff161F2C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          "CHE vs MUN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "2394834",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              const ClipboardData(text: "239346"),
                            );
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
