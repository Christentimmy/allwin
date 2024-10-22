import 'package:allwin/pages/booking_code_screen.dart';
import 'package:allwin/pages/homepage_screen.dart';
import 'package:allwin/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // Regular List for static pages
  final List<Widget> appPages = [
    const HomeScreen(),
    const BookingCodeScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060C1F),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff161F2C),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: GNav(
            duration: const Duration(milliseconds: 150),
            selectedIndex: _selectedIndex,
            activeColor: Colors.white,
            onTabChange: _onItemTapped,
            tabBackgroundColor: const Color(0xff4C546A),
            color: Colors.white,
            backgroundColor: const Color(0xff161F2C),
            tabs: const [
              GButton(icon: Icons.dashboard, text: "Home"), // Updated Home icon
              GButton(
                  icon: Icons.confirmation_number,
                  text: "Booking Code"), // Updated Booking Code icon
              GButton(
                  icon: Icons.account_circle,
                  text: "Account"), // Updated Profile icon
            ],
            padding: const EdgeInsets.all(10.0),
          ),
        ),
      ),
      body: appPages[_selectedIndex],
    );
  }
}
