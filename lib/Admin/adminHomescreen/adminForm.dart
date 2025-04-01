import 'package:flutter/material.dart';

class EventFormScreen extends StatefulWidget {
  final String eventType;
  const EventFormScreen({super.key, required this.eventType});

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String date = '';
  String location = '';
  String teams = '';
  String prize = '';
  String registerLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.eventType} Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                onChanged: (value) => date = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onChanged: (value) => location = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Teams (comma separated)'),
                onChanged: (value) => teams = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prize'),
                onChanged: (value) => prize = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Registration Link'),
                onChanged: (value) => registerLink = value,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Event Created Successfully!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _cardData = [
  {'title': 'Hackathons', 'icon': Icons.code, 'color': Colors.blue},
  {
    'title': 'Sports Events',
    'icon': Icons.sports_soccer,
    'color': Colors.green
  },
  {'title': 'Workshops', 'icon': Icons.school, 'color': Colors.orange},
  {'title': 'Seminars', 'icon': Icons.mic, 'color': Colors.red},
  {
    'title': 'Cultural Events',
    'icon': Icons.music_note,
    'color': Colors.purple
  },
  {'title': 'Announcements', 'icon': Icons.campaign, 'color': Colors.teal},
  {'title': 'Internships', 'icon': Icons.work, 'color': Colors.amber},
];
