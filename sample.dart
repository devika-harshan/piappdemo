import 'package:flutter/material.dart';
import 'package:piapp/education.dart';
import 'package:piapp/jobs.dart';
import 'package:piapp/license.dart';
import 'package:piapp/more.dart';
import 'package:piapp/skills.dart';
import 'package:provider/provider.dart';
import 'package:piapp/PageProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Skills(),
    const Education(),
    const License(),
    const Jobs(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          body: _pages[pageProvider.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff203B74), // Blue background
            currentIndex: pageProvider.currentPage,
            onTap: (index) {
              pageProvider.setPage(index);
            },
            selectedItemColor: Colors.white, // Text color for selected item
            unselectedItemColor:
                Colors.white70, // Text color for unselected items
            items: [
              _buildBottomNavItem("Images/Home.png", "Home", 0, pageProvider),
              _buildBottomNavItem(
                  "Images/Intelligence.png", "Skills", 1, pageProvider),
              _buildBottomNavItem(
                  "Images/Training.png", "Education", 2, pageProvider),
              _buildBottomNavItem(
                  "Images/Smart Card.png", "License", 3, pageProvider),
              _buildBottomNavItem(
                  "Images/New Job.png", "Jobs", 4, pageProvider),
              _buildBottomNavItem(
                  "Images/Settings.png", "More", 5, pageProvider),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      String imagePath, String label, int index, PageProvider pageProvider) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(top: 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background for selected item
            if (pageProvider.currentPage == index)
              Container(
                padding: EdgeInsets.zero,
                width: 62.w, // Adjust width as needed
                height: 50.h, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0), // Straight top edges
                    bottom: Radius.circular(10), // Curved bottom edges
                  ),
                ),
              ),
            // The actual image
            Image.asset(
              imagePath,
              width: 35.w,
              height: 35.h,
            ),
          ],
        ),
      ),
      label: label,
    );
  }
}
