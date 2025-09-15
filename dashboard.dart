import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(),

            // Featured Tutorials Section
            const SizedBox(height: 20),
            _buildSectionHeader(context, 'Featured Tutorials', 'View All'),
            const SizedBox(height: 10),
            _buildFeaturedTutorials(),

            // Nearby Repair Shops Section
            const SizedBox(height: 30),
            _buildSectionHeader(context, 'Nearby Repair Shops', 'View on Map'),
            const SizedBox(height: 10),
            _buildNearbyShops(),

            // Eco-Friendly Tips Section
            const SizedBox(height: 30),
            _buildSectionHeader(context, 'Eco-Friendly Tips', ''),
            const SizedBox(height: 10),
            _buildEcoTips(),

            // Your Eco Impact Section
            const SizedBox(height: 30),
            _buildSectionHeader(context, 'Your Eco Impact', ''),
            const SizedBox(height: 10),
            _buildEcoImpact(),

            // ⭐ NEW SECTION: COMMUNITY HIGHLIGHTS ⭐
            const SizedBox(height: 30),
            _buildSectionHeader(context, 'Community Highlights', ''),
            const SizedBox(height: 10),
            _buildCommunityHighlights(),

            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }

  // --- UI Widget Builders ---

  Widget _buildHeader() {
    return Container(
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
                  const Icon(Icons.search, color: Colors.white),
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
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String linkText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (linkText.isNotEmpty)
            TextButton(
              onPressed: () {
                // Add navigation logic here
              },
              child: Text(
                linkText,
                style: const TextStyle(color: Color(0xFF1ABC9C)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeaturedTutorials() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildTutorialCard(
            imagePath: 'assets/images/replace.jpg',
            title: 'Charging Port Cleaning',
            subtitle: 'A Quick and Safe Way to Clean Out Lint and Debris.',
            buttonText: 'Find a Guide',
          ),
          const SizedBox(width: 16),
          _buildTutorialCard(
            imagePath: 'assets/images/replace.jpg',
            title: 'Battery Guide',
            subtitle: 'Extend your phone battery life',
            buttonText: 'View Guide',
          ),
          const SizedBox(width: 16),
          _buildTutorialCard(
            imagePath: 'assets/images/replace.jpg',
            title: 'Laptop Overheating Fix',
            subtitle: 'Quickly Cool Down Your Laptop to Prevent Damage.',
            buttonText: 'View Guide',
          ),
          const SizedBox(width: 16),
          _buildTutorialCard(
            imagePath: 'assets/images/replace.jpg',
            title: 'Fixing a Leaky Faucet',
            subtitle: 'Fix a Leaky Faucet in 5 Simple Steps.',
            buttonText: 'View Guide',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildTutorialCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1ABC9C),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: Text(buttonText, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyShops() {
    return Column(
      children: [
        _buildShopCard(
          icon: Icons.build,
          name: 'TechFix Center',
          rating: 4.7,
          distance: '1.2 km',
          services: 'Phones • Laptops • Accessories',
        ),
        _buildShopCard(
          icon: Icons.phone_android,
          name: 'GreenTech Repair Hub',
          rating: 4.9,
          distance: '0.8 km',
          services: 'Phones • Laptops • Accessories',
        ),
      ],
    );
  }

  Widget _buildShopCard({
    required IconData icon,
    required String name,
    required double rating,
    required String distance,
    required String services,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.green),
            ),
            const SizedBox(width: 16),
            Expanded(
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
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        distance,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    services,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1ABC9C),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: const Text('Visit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEcoTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildEcoTipCard(
            icon: Icons.eco,
            title: 'Did you know?',
            description: 'Repairing a laptop fan saves up to ₱3,000 and prevents overheating damage.',
            color: const Color(0xFFE8F5E9),
            iconColor: Colors.green,
          ),
          const SizedBox(height: 10),
          _buildEcoTipCard(
            icon: Icons.recycling,
            title: 'Impact Fact',
            description: 'One repaired phone prevents 55kg of e-waste from polluting our environment.',
            color: const Color(0xFFE3F2FD),
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  // ⭐ The missing _buildEcoTipCard function is inserted here. ⭐
  Widget _buildEcoTipCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Color iconColor,
  }) {
    return Card(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ⭐ NEW WIDGET: Community Highlights Section ⭐
  Widget _buildCommunityHighlights() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildHighlightCard(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_maria.jpg'), // Replace with your image
            ),
            title: 'Success Story',
            subtitle: 'Maria repaired her tablet using DIY tutorial – saved ₱4,500!',
            tag: 'Eco-Saver',
          ),
          const SizedBox(height: 10),
          _buildHighlightCard(
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.store, color: Colors.blue),
            ),
            title: 'Shop Highlight',
            subtitle: 'GreenTech Repair Hub helped 200+ users this month!',
            linkText: 'Share Your Story',
          ),
        ],
      ),
    );
  }

  Widget _buildEcoImpact() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImpactCircle('2', 'Devices Saved', Colors.green),
                _buildImpactCircle('10', 'kg E-waste Avoided', Colors.blue),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1ABC9C)),
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            const Text(
              'Keep going! Try one more repair to reach your monthly goal.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactCircle(String value, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.5), width: 3),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // ⭐ NEW WIDGET: Helper for Community Highlights Cards ⭐
  Widget _buildHighlightCard({
    required Widget leading,
    required String title,
    required String subtitle,
    String? tag,
    String? linkText,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle),
                  const SizedBox(height: 8),
                  if (tag != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (linkText != null)
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        linkText,
                        style: const TextStyle(color: Color(0xFF1ABC9C), fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}