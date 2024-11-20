import 'package:allwin/controller/all_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BookingCodeScreen extends StatefulWidget {
  const BookingCodeScreen({super.key});

  @override
  State<BookingCodeScreen> createState() => _BookingCodeScreenState();
}

class _BookingCodeScreenState extends State<BookingCodeScreen> {
  final _allRequest = Get.put(AllRequestController());
  @override
  void initState() {
    super.initState();
    if (!_allRequest.isBookingLoaded.value) {
      _allRequest.getBookingCodes();
    }
  }

  String _selectedSortOption = 'Date (Newest)';

  // Sorting logic
  void _sortBookingData() {
    setState(() {
      if (_selectedSortOption == 'Date (Newest)') {
        _allRequest.bookingCodeList
            .sort((a, b) => b.startDate.compareTo(a.startDate));
      } else if (_selectedSortOption == 'Date (Oldest)') {
        _allRequest.bookingCodeList
            .sort((a, b) => a.startDate.compareTo(b.startDate));
      } else if (_selectedSortOption == 'Total Odd (Highest)') {
        _allRequest.bookingCodeList
            .sort((a, b) => b.totalOdd.compareTo(a.totalOdd));
      } else if (_selectedSortOption == 'Total Odd (Lowest)') {
        _allRequest.bookingCodeList
            .sort((a, b) => a.startDate.compareTo(b.startDate));
      } else if (_selectedSortOption == 'Result (Win)') {
        _allRequest.bookingCodeList
            .sort((a, b) => a.result.compareTo(b.result));
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
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
            Obx(() {
              if (_allRequest.isBookingLoading.value) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else if (_allRequest.bookingCodeList.isEmpty) {
                return const Expanded(
                  child: Text(
                    "No Booking Available",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _allRequest.bookingCodeList.length,
                    itemBuilder: (context, index) {
                      final booking = _allRequest.bookingCodeList[index];
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
                                booking.platform,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            // Total Odd
                            Expanded(
                              flex: 1,
                              child: Text(
                                booking.totalOdd,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            // Booking Code
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    booking.bookingCode,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: booking.bookingCode,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Booking code copied!"),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                    ),
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Result Badge (Win/Loss/Processing)
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: resultColor[booking.result],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  booking.result.isEmpty
                                      ? "Progress"
                                      : booking.result,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
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
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

const Map<String, Color> resultColor = {
  "win": Colors.green,
  "loss": Colors.red,
  "": Colors.orange,
};
