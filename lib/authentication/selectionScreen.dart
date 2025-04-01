import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_app/authentication/loginPage.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF87CEEB), Color(0xFF4682B4)], // Sky Blue Shades
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Title
              Text(
                "Select Your Role",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 30),

              // Animated Student Button
              _buildAnimatedButton("Login as Student", Icons.school, () {
                Get.to(() => LoginScreen(role: 'student'),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              }),

              const SizedBox(height: 20),

              // Animated Admin Button
              _buildAnimatedButton("Login as Admin", Icons.admin_panel_settings,
                  () {
                Get.to(() => LoginScreen(role: 'admin'),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        final isPressed = false.obs;
        return MouseRegion(
          onEnter: (_) => isPressed.value = true,
          onExit: (_) => isPressed.value = false,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: isPressed.value ? 1.05 : 1.0,
            child: Container(
              width: 260,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), // Glassmorphism effect
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.white.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white, size: 24),
                  const SizedBox(width: 10),
                  Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
