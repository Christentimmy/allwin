import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingCodeScreen extends StatefulWidget {
  const BookingCodeScreen({super.key});

  @override
  _BookingCodeScreenState createState() => _BookingCodeScreenState();
}

class _BookingCodeScreenState extends State<BookingCodeScreen> {
  String _selectedSortOption = 'Date (Newest)';

  // Sample booking data with "null" for processing results
  List<Map<String, dynamic>> bookingData = [
    {
      "platform": "Betway",
      "odd": 5.67,
      "code": "2394834",
      "result": "Win",
      "date": DateTime.now()
    },
    {
      "platform": "Bet9ja",
      "odd": 3.50,
      "code": "2392934",
      "result": "Loss",
      "date": DateTime.now().subtract(const Duration(days: 1))
    },
    {
      "platform": "BetKing",
      "odd": 7.12,
      "code": "1294834",
      "result": null,
      "date": DateTime.now().subtract(const Duration(days: 2))
    }, // Processing
    {
      "platform": "1xBet",
      "odd": 4.20,
      "code": "4394834",
      "result": null,
      "date": DateTime.now().subtract(const Duration(days: 3))
    }, // Processing
  ];

  // Sorting logic
  void _sortBookingData() {
    setState(() {
      if (_selectedSortOption == 'Date (Newest)') {
        bookingData.sort((a, b) => b['date'].compareTo(a['date']));
      } else if (_selectedSortOption == 'Date (Oldest)') {
        bookingData.sort((a, b) => a['date'].compareTo(b['date']));
      } else if (_selectedSortOption == 'Total Odd (Highest)') {
        bookingData.sort((a, b) => b['odd'].compareTo(a['odd']));
      } else if (_selectedSortOption == 'Total Odd (Lowest)') {
        bookingData.sort((a, b) => a['odd'].compareTo(b['odd']));
      } else if (_selectedSortOption == 'Result (Win)') {
        bookingData.sort((a, b) => a['result'].compareTo(b['result']));
      }
    });
  }

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
            // Sort By Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort By:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    dropdownColor: const Color(0xff161F2C),
                    value: _selectedSortOption,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: <String>[
                      'Date (Newest)',
                      'Date (Oldest)',
                      'Total Odd (Highest)',
                      'Total Odd (Lowest)',
                      'Result (Win)',
                      'Result (Loss)'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSortOption = value!;
                        _sortBookingData();
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white),
            // Headings row
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Betting Platform",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Total Odd",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Booking Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Result",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white),
            Expanded(
              child: ListView.builder(
                itemCount: bookingData.length,
                itemBuilder: (context, index) {
                  final booking = bookingData[index];
                  return Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xff161F2C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Betting Platform
                        Expanded(
                          flex: 2,
                          child: Text(
                            booking["platform"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        // Total Odd
                        Expanded(
                          flex: 1,
                          child: Text(
                            booking["odd"].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        // Booking Code
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                booking["code"],
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: booking["code"]),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Booking code copied!"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                icon:
                                    const Icon(Icons.copy, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Result Badge (Win/Loss/Processing)
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: booking["result"] == "Win"
                                  ? Colors.green
                                  : booking["result"] == "Loss"
                                      ? Colors.red
                                      : Colors.orange, // Processing color
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              booking["result"] ?? "loading",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
