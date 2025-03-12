import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_app/Views/profile/aboutUs.dart';
import 'package:uni_app/Views/profile/edit_profile.dart';
import 'package:uni_app/Views/profile/termsAndCondition.dart';
import 'package:uni_app/Views/profile/virtualcard.dart';
import 'package:uni_app/authentication/sharedPreferences.dart';
import 'package:uni_app/authentication/sqfliteController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MainProfilePage();
}

class _MainProfilePage extends State<ProfilePage> {
  final List<Widget> _profilePages = [
    const Editprofilepage(),
    const VirtualCardPage(),
    const AboutUsPage(),
    const TermsConditionsPage(),
  ];
  @override
  int selectedPage = 0;

  Widget profilePage() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 249, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Profile",
            style: GoogleFonts.jost(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profileData["profileUrl"] ??
                      "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              profileData["name"] ?? "Student Name",
              style:
                  GoogleFonts.jost(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              profileData["email"] ?? "studentemail@gmail.com",
              style: GoogleFonts.mulish(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            createContainer(Icons.person, "Edit Profile", 0),
            const SizedBox(height: 15),
            createContainer(Icons.account_box_rounded, "Virtual Id", 1),
            const SizedBox(height: 15),
            createContainer(Icons.group, "About Us", 2),
            const SizedBox(height: 15),
            createContainer(Icons.description, "Terms and Conditions", 3),
            const SizedBox(height: 15),
            createContainer(Icons.logout, "Logout", -1),
          ],
        ),
      ),
    );
  }

  // void _signOut() async {
  //   await Authservice().signOut();
  //   // SqfliteController().handleLogOut();
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) => const Signinpage()),
  //     (route) => false,
  //   );
  // }

  Widget createContainer(IconData icon, String info, int index) {
    return GestureDetector(
      onTap: () {
        if (index >= 0 && index < _profilePages.length) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _profilePages[index]),
          );
        } else if (index == -1) {
          // Show confirmation dialog for logout
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text("Logout Confirmation"),
                content: const Text("Are you sure you want to log out?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red)),
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      SharedPreferenceController.setData(
                          isLogin: false, studentID: "");
                      //_signOut();
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue)),
                    child: const Text("Confirm",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                info,
                style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 20, top: 5),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchCollegeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return profilePage();
  }
}
