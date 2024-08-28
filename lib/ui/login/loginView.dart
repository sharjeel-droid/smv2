import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = Get.find<LoginViewModel>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Login To Your Account",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF003366)),
              ),
              const SizedBox(height: 24),
              Form(
                key: _viewModel.loginFormKey(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) =>
                          {_viewModel.handleUserNameChanges(value)},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: _obscureText,
                      onSaved: (value) =>
                          {_viewModel.handlePasswordChanges(value)},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: false, // Replace with actual logic
                          onChanged: (bool? value) {
                            // Handle change
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Color(0xFF003366)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color(0xFFFFD700),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        _viewModel.checkLogin();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Handle "Forgot your password?"
                      },
                      child: const Text(
                        "Forgot your password?",
                        style: TextStyle(color: Color(0xFFFFD700)),
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Color(0xFF003366),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Continue with",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF003366),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.google,
                          color: const Color(0xFFDB4437),
                          onPressed: () {
                            // Handle Google login
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.facebookF,
                          color: const Color(0xFF4267B2),
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.apple,
                          color: Colors.black,
                          onPressed: () {
                            // Handle Apple login
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Color(0xff003366)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle "Sign up"
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Color(0xFFFFD700)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 40), // Optional: to adjust the bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorfulSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 32,
          color: color,
        ),
      ),
    );
  }
}
