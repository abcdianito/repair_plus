import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // State variables for password visibility and terms agreement
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background is now solid white
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
              children: [
                const Spacer(flex: 1),

                // RePair+ Logo and Title
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC8E6C9), // Light green background
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.recycling,
                          color: Color(0xFF22C55E),
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'RePair+',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // Minimized spacing

                const Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Color(0xFF1ABC9C),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Join us and start your eco journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Spacer(),

                // Sign Up Form Fields with Labels
                const Text(
                  'Full Name',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.person, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Email Address',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Create a password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Confirm Password',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 16),

                // Terms and Privacy Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _agreedToTerms = newValue!;
                        });
                      },
                      activeColor: const Color(0xFF1ABC9C),
                      checkColor: Colors.white,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree to the ',
                          style: const TextStyle(color: Colors.black54),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              style: const TextStyle(color: Color(0xFF1ABC9C), fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle tap on Terms of Service
                                },
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(color: Color(0xFF1ABC9C), fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle tap on Privacy Policy
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _agreedToTerms ? () {
                      // Handle sign up
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Color(0xFF1ABC9C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}