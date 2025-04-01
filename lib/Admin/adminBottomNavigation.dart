import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uni_app/Admin/adminHomescreen/adminHomescreen.dart';
import 'package:uni_app/Views/profile/profile_page.dart';

class AdminBottomnavigationbarCustom extends StatelessWidget {
  const AdminBottomnavigationbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(20),
          colorBehindNavBar: Colors.white),
      context,
      navBarHeight: 70,
      navBarStyle: NavBarStyle.style1,
      screens: [
        AdminHomeScreen(),
        Container(),
        ProfilePage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home_outlined,
            size: 36,
          ),
          inactiveIcon: const Icon(
            Icons.home_outlined,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.analytics_outlined,
            size: 36,
          ),
          inactiveIcon: const Icon(Icons.analytics_outlined),
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(
              "assets/harli.jpg",
            ),
          ),
          icon: Container(
            clipBehavior: Clip.antiAlias,
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
