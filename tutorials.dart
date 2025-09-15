import 'package:flutter/material.dart';

// Import all the necessary repair screen files
import '/views/tutorials/phonerepair.dart';
import '/views/tutorials/laptoprepair.dart';
import '/views/tutorials/macrepair.dart';
import '/views/tutorials/tabletrepair.dart';
import '/views/tutorials/hardwarerepair.dart';
import '/views/tutorials/electronicrepair.dart';
import '/views/tutorials/searchtutorial.dart'; // New import for the search page

class TutorialScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.phone_android,
      'title': 'Phones',
      'subtitle': 'Screen, battery, charging port, etc.',
      'screen': PhoneTutorialsScreen(),
    },
    {
      'icon': Icons.laptop_mac,
      'title': 'PC & Laptops',
      'subtitle': 'Keyboard, fan cleaning, thermal paste',
      'screen': LaptopTutorialsScreen(),
    },
    {
      'icon': Icons.apple,
      'title': 'Mac & iMac',
      'subtitle': 'Specialized Apple guides',
      'screen': MacTutorialsScreen(), // Now linked to the correct screen
    },
    {
      'icon': Icons.tablet_mac,
      'title': 'Tablets & iPads',
      'subtitle': 'Screen, battery, speakers',
      'screen': TabletTutorialsScreen(), // Now linked to the correct screen
    },
    {
      'icon': Icons.hardware,
      'title': 'Hardware',
      'subtitle': 'Components and tools',
      'screen': HardwareTutorialsScreen(), // New category
    },
    {
      'icon': Icons.handyman,
      'title': 'Electronics',
      'subtitle': 'Miscellaneous gadgets',
      'screen': ElectronicTutorialsScreen(), // New category
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
              decoration: const BoxDecoration(
                color: Color(0xFF1ABC9C),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.build, color: Colors.white),
                          const SizedBox(width: 8),
                          const Text(
                            'RePair+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Search Icon with navigation
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SearchTutorialView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.notifications_none, color: Colors.white),
                          const SizedBox(width: 16),
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/replace.jpg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Good morning! Ready to repair today?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // The rest of the body from your original code
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What do you need to fix?',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Choose a category to get started',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCategoriesGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: _categories.map((category) {
        return _buildCategoryCard(
          context: context,
          icon: category['icon'],
          title: category['title'],
          subtitle: category['subtitle'],
          screen: category['screen'],
        );
      }).toList(),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget screen,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1ABC9C).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF1ABC9C),
                  size: 69,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}