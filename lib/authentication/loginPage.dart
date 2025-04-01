import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_app/Admin/adminBottomNavigation.dart';
import 'package:uni_app/Views/homescreen/home_screen.dart';
import 'package:uni_app/Views/profile/profile_page.dart';
import 'package:uni_app/bottomnavigationbar_custom.dart';
import 'signUpPage.dart';

class LoginScreen extends StatelessWidget {
  final String role;
  LoginScreen({super.key, required this.role});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  void _handleLogin() {
    if (role == "student") {
      Get.off(() => const BottomnavigationbarCustom(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1));
    } else {
      Get.off(() => const AdminBottomnavigationbarCustom(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false
      ,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Logo
                  Image.asset("assets/splash.png", height: 120),
                  const SizedBox(height: 20),

                  // Login Title
                  Text(
                    "Log In",
                    style: GoogleFonts.ptSans(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Please sign in to continue",
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email TextField
                  _buildTextField(
                    controller: emailController,
                    icon: Icons.email,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 15),

                  // Password TextField
                  Obx(() => _buildTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        hintText: "Password",
                        isPassword: true,
                        isPasswordVisible: isPasswordVisible,
                      )),
                  const SizedBox(height: 15),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.ptSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  GestureDetector(
                    onTap: _handleLogin,
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: GoogleFonts.ptSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF3A7BD5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: GoogleFonts.alatsi(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignUpScreen(),
                            transition: Transition.rightToLeft),
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.alatsi(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool isPassword = false,
    RxBool? isPasswordVisible,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !(isPasswordVisible?.value ?? true),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        prefixIcon: Icon(icon, color: Colors.blue),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  (isPasswordVisible?.value ?? false)
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blue,
                ),
                onPressed: () => isPasswordVisible?.toggle(),
              )
            : null,
        hintText: hintText,
        hintStyle: GoogleFonts.ptSans(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
