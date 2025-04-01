import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_app/Views/homescreen/subscriptionCard.dart';

class JobListingPage extends StatelessWidget {
  final List<Map<String, dynamic>> subscriptions;

  const JobListingPage({super.key, required this.subscriptions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subscriptions.length,
      itemBuilder: (context, index) {
        final subscription = subscriptions[index];

        final String name = subscription['title'] ?? "No Name";
        final String price = subscription['prize']?.toString() ?? "N/A";
        final String slots = subscription['location']?.toString() ?? "0";

        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ $price",
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    Text(
                      "$slots Slots",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>EventDetailsPage(subscription: subscription,));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("View Details"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
