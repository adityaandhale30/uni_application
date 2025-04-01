import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uni_app/Admin/adminHomescreen/adminForm.dart';
import 'package:uni_app/Views/profile/profile_page.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          itemCount: _cardData.length,
          itemBuilder: (context, index) {
            final data = _cardData[index];
            return GestureDetector(
              onTap: () => PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: EventFormScreen(eventType: data['title']),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.white,
                shadowColor: Colors.black.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(data['icon'], size: 50.0, color: data['color']),
                    const SizedBox(height: 16.0),
                    Text(
                      data['title']!,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _cardData = [
  {
    'title': 'Hackathons',
    'icon': Icons.code,
    'color': Colors.blue,
  },
  {
    'title': 'Sports Events',
    'icon': Icons.sports_soccer,
    'color': Colors.green,
  },
  {
    'title': 'Workshops',
    'icon': Icons.school,
    'color': Colors.orange,
  },
  {
    'title': 'Seminars',
    'icon': Icons.mic,
    'color': Colors.red,
  },
  {
    'title': 'Cultural Events',
    'icon': Icons.music_note,
    'color': Colors.purple,
  },
  {
    'title': 'Announcements',
    'icon': Icons.campaign,
    'color': Colors.teal,
  },
  {
    'title': 'Internships',
    'icon': Icons.work,
    'color': Colors.amber,
  },
];
