import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SubscriptionCard extends StatelessWidget {
  final List<Map<String, dynamic>> subscriptions;

  const SubscriptionCard({super.key, required this.subscriptions});

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
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade800],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: VStack([
                name.text.bold.white.xl2.make(),
                10.heightBox,
                HStack([
                  "₹ $price".text.yellow600.xl.make(),
                  " | ".text.white.make(),
                  "$slots Slots".text.white.make(),
                ]),
                20.heightBox,
                ElevatedButton(
                  onPressed: () => Get.to(() => EventDetailsPage(subscription: subscription)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: "View Details".text.blue600.bold.make(),
                ).objectCenterRight(),
              ]),
            ),
          ),
        );
      },
    );
  }
}

class EventDetailsPage extends StatelessWidget {
  final Map<String, dynamic> subscription;

  const EventDetailsPage({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    final String name = subscription['title'] ?? "No Name";
    final String price = subscription['prize']?.toString() ?? "N/A";
    final String slots = subscription['location']?.toString() ?? "0";

    return Scaffold(
      appBar: AppBar(
        title: name.text.white.make(),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VStack([
          "Event Details".text.xl3.bold.blue600.make(),
          20.heightBox,
          "Name: $name".text.xl.make(),
          "Price: ₹ $price".text.xl.make(),
          "Slots: $slots".text.xl.make(),
          30.heightBox,
          ElevatedButton(
            onPressed: () => Get.snackbar("Success", "You have registered for the event!"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: "Register for Event".text.white.bold.make(),
          ).objectCenter(),
        ]),
      ),
    );
  }
}
