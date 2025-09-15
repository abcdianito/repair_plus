import 'package:flutter/material.dart';

// Assuming login_signup_view.dart and BottomNavbar.dart are also in the 'views' folder
import 'login_signup.dart';
import 'BottomNavbar.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper method to build a single page indicator
  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  // Function to build the UI for the main content of each page
  Widget _buildPageContent({
    required String title,
    required String subtitle,
    required Widget imageWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          imageWidget,
          const SizedBox(height: 50),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 100),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  // Function to navigate to the login/signup screen
  void _navigateToMainScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginSignupView()),
    );
  }

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
            begin: Alignment.centerLeft, // Gradient starts from the center left
            end: Alignment.centerRight, // Gradient ends at the center right
          ),
        ),
        child: Stack(
          children: [
            // Background Circles (adjusted to potentially blend better with new gradient)
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

            // Swipeable Pages
            PageView(
              controller: _pageController,
              children: [
                _buildPageContent(
                  title: 'Repair. Reuse.\nReduce.',
                  subtitle: 'Join us in extending the life of your gadgets and reducing e-waste.',
                  imageWidget: Container(
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.phone_android,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                _buildPageContent(
                  title: "Track Your Gadget's\nLifespan",
                  subtitle: 'Monitor your repair history and extend the life of your electronics.',
                  imageWidget: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Icon(Icons.phone_android, size: 50, color: Color(0xFF1ABC9C)),
                                    const Icon(Icons.check_circle, color: Color(0xFF1ABC9C)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(Icons.laptop_mac, size: 50, color: Color(0xFF1ABC9C)),
                                    const Icon(Icons.check_circle, color: Color(0xFF1ABC9C)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            LinearProgressIndicator(
                              value: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1ABC9C)),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('4 Repairs', style: TextStyle(color: Colors.black54)),
                                Text('75% Complete', style: TextStyle(color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.insert_chart_outlined, color: Colors.grey.shade600),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.eco_outlined, color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildPageContent(
                  title: 'Find Nearby\nRepair Shops',
                  subtitle: 'Quickly locate trusted repair shops near you with our built-in locator.',
                  imageWidget: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.map_rounded, color: Colors.grey.shade600, size: 100),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.location_pin, color: Colors.blue.shade600),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.build, color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildPageContent(
                  title: 'DIY Repair\nTutorials',
                  subtitle: 'Access easy-to-follow guides to repair devices yourself, save money, and reduce waste.',
                  imageWidget: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/replace.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.build, color: Colors.grey.shade600),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.construction, color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Top Navigation
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage > 0
                        ? IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    )
                        : const SizedBox(width: 48),
                    TextButton(
                      onPressed: _navigateToMainScreen,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Page Indicator and Next/Start button
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) => _buildPageIndicator(index == _currentPage)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1ABC9C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_currentPage < 3) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else {
                            _navigateToMainScreen();
                          }
                        },
                        child: Text(
                          _currentPage < 3 ? 'Next' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}