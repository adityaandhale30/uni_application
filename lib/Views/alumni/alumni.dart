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
    imageUrl: 'https://via.placeholder.com/150',
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
    profession: 'Cloud Engineer',
    imageUrl: 'https://via.placeholder.com/150',
    email: 'yash@example.com',
    phone: '123-456-7891',
    linkedin: 'https://www.linkedin.com/in/yash/',
    location: 'Mumbai, India',
    skills: 'AWS, Azure, DevOps',
    company: 'TechCorp',
    degree: 'M.Tech',
    social: 'https://twitter.com/yash',
    hobbies: 'Gaming, Travelling',
    linkedinProfile: 'https://www.linkedin.com/in/yash/',
  ),
  AlumniModel(
    name: 'Naresh Shewale',
    batch: '2019',
    profession: 'Cloud Engineer',
    imageUrl: 'https://via.placeholder.com/150',
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
    imageUrl: 'https://via.placeholder.com/150',
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
    profession: 'Civil Engineer',
    imageUrl: 'https://via.placeholder.com/150',
    email: 'rajesh@example.com',
    phone: '123-456-7894',
    linkedin: 'https://www.linkedin.com/in/rajesh/',
    location: 'Chennai, India',
    skills: 'Civil Engineering, Site Management',
    company: 'InfraBuild',
    degree: 'M.Tech',
    social: 'https://twitter.com/rajesh',
    hobbies: 'Gardening, Cycling',
    linkedinProfile: 'https://www.linkedin.com/in/rajesh/',
  ),
  AlumniModel(
    name: 'Umesh Patil',
    batch: '2020',
    profession: 'Primary Teacher',
    imageUrl: 'https://via.placeholder.com/150',
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

















// Assume that 'alumniList' is a global variable of type List<AlumniModel>
// and AlumniModel contains properties: name, batch, profession, imageUrl, email, phone, linkedin, location, skills, company, degree, social, hobbies, linkedinProfile.

class PreviousStudentConnection extends StatelessWidget {
  const PreviousStudentConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Alumni Network".text.white.make(),
        backgroundColor: Colors.teal,
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
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.deepPurple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: alumni.name,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: CachedNetworkImageProvider(alumni.imageUrl),
                            // While loading, show a shimmer effect:
                            child: CachedNetworkImage(
                              imageUrl: alumni.imageUrl,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(color: Colors.grey),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        alumni.name.text.white.bold.lg.makeCentered(),
                        "Batch: ${alumni.batch}".text.white.makeCentered(),
                        alumni.profession.text.white.italic.makeCentered(),
                        const SizedBox(height: 8),
                        const SpinKitFadingCircle(color: Colors.white, size: 20.0),
                      ],
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
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: VStack(
          [
            Center(
              child: Hero(
                tag: alumni.name,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: CachedNetworkImageProvider(alumni.imageUrl),
                ),
              ),
            ),
            20.heightBox,
            "Name: ${alumni.name}".text.xl.bold.make(),
            "Batch: ${alumni.batch}".text.lg.make(),
            "Profession: ${alumni.profession}".text.lg.make(),
            "Email: ${alumni.email}".text.lg.make(),
            "Phone: ${alumni.phone}".text.lg.make(),
            "Location: ${alumni.location}".text.lg.make(),
            "Company: ${alumni.company}".text.lg.make(),
            "Degree: ${alumni.degree}".text.lg.make(),
            "LinkedIn: ${alumni.linkedinProfile}".text.lg.make(),
            "Skills: ${alumni.skills}".text.lg.make(),
            "Hobbies: ${alumni.hobbies}".text.lg.make(),
          ],
          crossAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}

