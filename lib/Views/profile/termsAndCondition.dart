import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainTermsConditionsPage();
}

class _MainTermsConditionsPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 249, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.jost(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Introduction",
                style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Welcome to [Your Platform Name], a platform designed to facilitate online learning and collaboration. By using our platform, you agree to be bound by these Terms and Conditions, which govern your use of our services.",
                style: GoogleFonts.mulish(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ExpansionTile(
                title: Text(
                  "1. Acceptable Use",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "You agree to use our platform for lawful purposes only. You must not use our platform to transmit or store any material that is unlawful, harassing, libelous, abusive, threatening, or obscene.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "2. User Accounts",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "You are responsible for maintaining the confidentiality of your account and password. You agree to notify us immediately of any unauthorized use of your account or password.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "3. Intellectual Property",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "All content on our platform is the property of [Your Platform Name] or its licensors. You agree not to reproduce, distribute, or display any content without our prior written consent.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "4. Disclaimer of Warranties",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "Our platform is provided on an 'as is' and 'as available' basis. We disclaim all warranties, express or implied, including but not limited to implied warranties of merchantability, fitness for a particular purpose, and non-infringement.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "5. Limitation of Liability",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "In no event shall we be liable for any damages, including but not limited to incidental, consequential, or punitive damages, arising out of the use of our platform.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "6. Governing Law",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "These Terms and Conditions shall be governed by and construed in accordance with the laws of India.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "7. Changes to Terms and Conditions",
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "We reserve the right to modify these Terms and Conditions at any time. Your continued use of our platform shall be deemed acceptance.",
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
