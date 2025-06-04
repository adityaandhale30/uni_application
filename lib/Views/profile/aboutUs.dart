import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "About Us",
          style: GoogleFonts.jost(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 11, 8, 118)
                          .withOpacity(0.7),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Welcome to our platform",
                          style: GoogleFonts.jost(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.network(
                        "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201908/learning_online_digital_analyt.jpeg?VersionId=HZF3HNOIxGPjQFb6t1ummfSpWlcvcHrk",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Our Mission Section
              Text(
                "Our Mission",
                style: GoogleFonts.jost(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Our mission is to provide a seamless and efficient way for students to submit their assignments and projects. We strive to make the process as easy and convenient as possible, while also ensuring the security and integrity of the submissions.",
                style: GoogleFonts.jost(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),

              // Our Team Section
              Text(
                "Our Team",
                style: GoogleFonts.jost(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/team1.jpg"),
                        radius: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Aaditya\nAandhale",
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/team2.jpg"),
                        radius: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sunil\nBandichode",
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/team3.jpg"),
                        radius: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Yashodip\nThakare",
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Contact Us Section
              Text(
                "Get in Touch",
                style: GoogleFonts.jost(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "If you have any questions or need help with our platform, please don't hesitate to contact us.",
                style: GoogleFonts.jost(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Add your email address here
                        const String email = "ganuthakare99@gmail.com";
                        final Uri emailUri = Uri.parse("mailto:$email");
                        await launchUrl(emailUri);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text(
                        "Email Us",
                        style: GoogleFonts.jost(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Add your phone number here
                        const String phoneNumber = "7666556478";
                        final Uri phoneUri = Uri.parse("tel:$phoneNumber");
                        await launchUrl(phoneUri);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: Text(
                        "Call Us",
                        style: GoogleFonts.jost(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
