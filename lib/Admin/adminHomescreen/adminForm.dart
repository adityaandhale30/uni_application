import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_app/Models/home_tab_model.dart';

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
  String prize = '';
  String registerLink = '';
  // Create a TextEditingController for the date field.
  final TextEditingController _dateController = TextEditingController();

  // Function to show date picker and update the date field.
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      setState(() {
        date = DateFormat('yyyy-MM-dd').format(picked);
        _dateController.text = date;
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('${widget.eventType} Form'),
        backgroundColor: const Color(0xFF87CEEB), // Sky blue color
        elevation: 4,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => title = value,
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a title' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Date (YYYY-MM-DD)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select a date' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => location = value,
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a location' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prize',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => prize = value,
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a prize' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Registration Link',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => registerLink = value,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please enter a registration link'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Adding the event to your home tab model
                        hometab[3].items.add({
                          'title': title,
                          'date': date,
                          'location': location,
                          'teams': [],
                          'prize': '\$ $prize Entry Fee',
                          'registerLink': registerLink,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Event Created Successfully!')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF87CEEB), // Sky blue button
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
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
