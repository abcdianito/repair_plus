import 'package:flutter/material.dart';
import 'dart:ui'; // For the BackdropFilter

import 'login.dart';
import 'signup.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF004D40), // Darker green on the left
              Color(0xFF22C55E), // Your specified green on the right
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            // Background Circles (consistent with onboarding)
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: -60,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  // Logo and App Name
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.build, color: Color(0xFF22C55E), size: 50),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'RePair+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Repair. Reuse. Reduce E-Waste.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),

                  // Frosted Glass Container with Icons
                  _buildGlassContainer(),
                  const Spacer(),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      label: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // The corrected navigation for the Sign Up button
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SignupView()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white.withOpacity(0.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                      label: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the frosted glass container
  Widget _buildGlassContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Frosted Glass Effect
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGlassIcon(Icons.phone_android),
                        _buildGlassIcon(Icons.laptop),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGlassIcon(Icons.tablet_mac),
                        _buildGlassIcon(Icons.headset),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Floating Icons
        Positioned(
          top: 10,
          right: 10,
          child: _buildFloatingIcon(Icons.eco, color: const Color(0xFF22C55E)),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: _buildFloatingIcon(Icons.cloud, color: const Color(0xFF0072FF)),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: _buildFloatingIcon(Icons.build, color: const Color(0xFF1ABC9C)),
        ),
      ],
    );
  }

  // Helper for icons inside the glass container
  Widget _buildGlassIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.blueGrey, size: 40),
    );
  }

  // Helper for the small floating icons
  Widget _buildFloatingIcon(IconData icon, {required Color color}) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white,
      child: Icon(icon, color: color, size: 20),
    );
  }
}