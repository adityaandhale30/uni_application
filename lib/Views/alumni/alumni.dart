import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// Assuming you have your AlumniModel defined somewhere:
class AlumniModel {
  final String name;
  final String batch;
  final String profession;
  final String imageUrl;
  final String email;
  final String phone;
  final String linkedin;
  final String location;
  final String skills;
  final String company;
  final String degree;
  final String social;
  final String hobbies;
  final String linkedinProfile;

  AlumniModel({
    required this.name,
    required this.batch,
    required this.profession,
    required this.imageUrl,
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.location,
    required this.skills,
    required this.company,
    required this.degree,
    required this.social,
    required this.hobbies,
    required this.linkedinProfile,
  });
}
final List<AlumniModel> alumniList = [
  AlumniModel(
    name: 'Aditya Andhale',
    batch: '2020',
    profession: 'Mobile Developer',
    imageUrl: "assets/homeAssets/alu2.jpeg",
    email: 'aditya@example.com',
    phone: '123-456-7890',
    linkedin: 'https://www.linkedin.com/in/aditya/',
    location: 'Pune, India',
    skills: 'Flutter, Dart, Firebase',
    company: 'Incubators Systems',
    degree: 'B.Tech',
    social: 'https://twitter.com/aditya',
    hobbies: 'Coding, Reading',
    linkedinProfile: 'https://www.linkedin.com/in/aditya/',
  ),
  AlumniModel(
    name: 'Yash Thakare',
    batch: '2018',
    profession: 'International Swimmer',
    imageUrl: "assets/homeAssets/alu3.jpg",
    email: 'yash@example.com',
    phone: '123-456-7891',
    linkedin: 'https://www.linkedin.com/in/yash/',
    location: 'Mumbai, India',
    skills: 'Swimming, Cycling',
    company: 'Federation ',
    degree: 'M.Tech',
    social: 'https://twitter.com/yash',
    hobbies: 'Gaming, Travelling',
    linkedinProfile: 'https://www.linkedin.com/in/yash/',
  ),
  AlumniModel(
    name: 'Naresh Shewale',
    batch: '2019',
    profession: 'Cloud Engineer',
    imageUrl: "assets/homeAssets/alu1.jpeg",
    email: 'naresh@example.com',
    phone: '123-456-7892',
    linkedin: 'https://www.linkedin.com/in/naresh/',
    location: 'Pune, India',
    skills: 'GCP, Docker, Kubernetes',
    company: 'CloudWave',
    degree: 'B.Tech',
    social: 'https://twitter.com/naresh',
    hobbies: 'Reading, Hiking',
    linkedinProfile: 'https://www.linkedin.com/in/naresh/',
  ),
  AlumniModel(
    name: 'Akash Thapa',
    batch: '2021',
    profession: 'Civil Engineer',
    imageUrl: "assets/homeAssets/alu4.jpeg",
    email: 'akash@example.com',
    phone: '123-456-7893',
    linkedin: 'https://www.linkedin.com/in/akash/',
    location: 'Delhi, India',
    skills: 'Structural Design, Project Management',
    company: 'BuildWell Ltd.',
    degree: 'B.Tech',
    social: 'https://twitter.com/akash',
    hobbies: 'Travelling, Photography',
    linkedinProfile: 'https://www.linkedin.com/in/akash/',
  ),
  AlumniModel(
    name: 'Rajesh Kumar',
    batch: '2017',
    profession: 'IAS Officer',
    imageUrl: "assets/homeAssets/alu7.webp",
    email: 'rajesh@example.com',
    phone: '123-456-7894',
    linkedin: 'https://www.linkedin.com/in/rajesh/',
    location: 'Chennai, India',
    skills: 'Civil Engineering, Site Management',
    company: 'Government of India',
    degree: 'B.Tech',
    social: 'https://twitter.com/rajesh',
    hobbies: 'Gardening, Cycling',
    linkedinProfile: 'https://www.linkedin.com/in/rajesh/',
  ),
  AlumniModel(
    name: 'Umesh Patil',
    batch: '2020',
    profession: 'Primary Teacher',
    imageUrl: "assets/homeAssets/alu6.webp",
    email: 'umesh@example.com',
    phone: '123-456-7895',
    linkedin: 'https://www.linkedin.com/in/umesh/',
    location: 'Nagpur, India',
    skills: 'Teaching, Child Psychology',
    company: 'Bright Future School',
    degree: 'B.Ed',
    social: 'https://twitter.com/umesh',
    hobbies: 'Reading, Music',
    linkedinProfile: 'https://www.linkedin.com/in/umesh/',
  ),
];















class PreviousStudentConnection extends StatelessWidget {
  const PreviousStudentConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF87CEEB), Color(0xFF00BFFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: const Text('Alumni Network', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 6,
            actions: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.search, color: Colors.white),
                onPressed: () {
                  // Implement search functionality
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        onRefresh: () async {
          // Refresh logic here
        },
        color: Colors.teal,
        child: MasonryGridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: alumniList.length,
          itemBuilder: (context, index) {
            final alumni = alumniList[index];
            return FadeInUp(
              delay: Duration(milliseconds: 100 * index),
              child: BounceInDown(
                child: GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => _buildAlumniDetail(alumni),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.1),
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: alumni.name,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(alumni.imageUrl),
                            ),
                          ),
                          const SizedBox(height: 10),
                          alumni.name.text.black.bold.lg.makeCentered(),
                          "Batch: ${alumni.batch}".text.black.makeCentered(),
                          alumni.profession.text.black.italic.makeCentered(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAlumniDetail(alumni) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: alumni.name,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(alumni.imageUrl),
            ),
          ),
          20.heightBox,
          "Name: ${alumni.name}".text.xl.bold.black.make(),
          "Batch: ${alumni.batch}".text.lg.black.make(),
          "Profession: ${alumni.profession}".text.lg.black.make(),
          "Email: ${alumni.email}".text.lg.black.make(),
          "Phone: ${alumni.phone}".text.lg.black.make(),
          "Location: ${alumni.location}".text.lg.black.make(),
          "Company: ${alumni.company}".text.lg.black.make(),
          "Degree: ${alumni.degree}".text.lg.black.make(),
          "LinkedIn: ${alumni.linkedinProfile}".text.lg.black.make(),
          "Skills: ${alumni.skills}".text.lg.black.make(),
          "Hobbies: ${alumni.hobbies}".text.lg.black.make(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Connect button logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00BFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Connect',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

