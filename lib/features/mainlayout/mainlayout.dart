import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/favorites/ui/favorits_screen.dart';
import 'package:fitness_app/features/mainlayout/home/ui/home_screen.dart';
import 'package:fitness_app/features/mainlayout/profile/ui/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_nav_bar/glass_nav_bar.dart';
import 'package:glass_nav_bar/nav_bar_item.dart';
import 'articles/ui/articles_screen.dart';
class Mainlayout extends StatefulWidget {
  const Mainlayout({super.key});

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    ArticlesScreen(),
    FavoritsScreen(),
    ProfileScreen(),
  ];
  final List<NavBarItem> items = [
    NavBarItem(label: '', icon: CupertinoIcons.home),
    NavBarItem(label: '', icon: CupertinoIcons.news),
    NavBarItem(label: '', icon: CupertinoIcons.folder_fill),
    NavBarItem(label: '', icon: CupertinoIcons.person_fill),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding:  REdgeInsets.all(30.0),
        child: Container(
          padding:  REdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: ColorsManager.lightPurple,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon(Icons.home_filled, 0),
              _buildIcon(CupertinoIcons.person_3, 1),
              _buildIcon(CupertinoIcons.folder, 2),
              _buildIcon(CupertinoIcons.person, 3),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildIcon(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding:  REdgeInsets.all(10.r),
        child: Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.white:ColorsManager.Purple,
            borderRadius: BorderRadius.circular(60.r),
          ),
          child: Icon(icon, color: isSelected ? ColorsManager.black: ColorsManager.lightPurple,
            size: isSelected? 46.sp: 30.sp,
          ),
        ),
      ),
    );
  }
}