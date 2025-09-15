import 'package:flutter/material.dart';

class MacTutorialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(context),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  // "Quick Access" Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Access',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildQuickAccessButtons(),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // "24 Categories" Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '3 Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildCategoriesGrid(context),
                    ],
                  ),
                ],
              ),
            ),

            // ⭐ NEW SECTION: Featured Tutorials
            const SizedBox(height: 30),
            _buildFeaturedTutorials(),

            // ⭐ NEW SECTION: Replacement Guides
            const SizedBox(height: 30),
            _buildReplacementGuides(),

            // ⭐ NEW SECTION: Maintenance & Fixes
            const SizedBox(height: 30),
            _buildMaintenanceAndFixes(),

            // ⭐ NEW SECTION: Community Highlights
            const SizedBox(height: 30),
            _buildCommunityHighlights(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
      color: const Color(0xFF1ABC9C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Icon(Icons.search, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.laptop_mac, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mac Repair',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Repair guides and disassembly information for Apples Macintosh personal computers.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatsChip('50+ Guides'),
              _buildStatsChip('10k+ Repairs'),
              _buildStatsChip('95% Success'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsChip(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildQuickAccessButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildQuickAccessCard(
            icon: Icons.search,
            label: 'Search Guides',
            iconColor: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildQuickAccessCard(
            icon: Icons.bookmark_border,
            label: 'Saved',
            iconColor: Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildQuickAccessCard(
            icon: Icons.history,
            label: 'Recent',
            iconColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return OutlinedButton(
      onPressed: () {
        // Add functionality here
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: iconColor,
        side: BorderSide(color: iconColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: iconColor)),
        ],
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
      children: [
        _buildCategoryCard(
          context: context,
          imagePath: 'assets/images/laptop_model.jpg',
          title: 'Mac Laptops',
        ),
        _buildCategoryCard(
          context: context,
          imagePath: 'assets/images/macbook_model.jpg',
          title: 'Mac Desktop',
        ),
        _buildCategoryCard(
          context: context,
          imagePath: 'assets/images/general_guides.jpg',
          title: 'Mac Hardware and Accessories',
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String imagePath,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        // Add navigation logic here for sub-categories
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 100),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ⭐ NEW SECTION: Method to build the Featured Tutorials section
  Widget _buildFeaturedTutorials() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Tutorials',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Hot',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_screen.jpg',
            title: 'How to Install an M.2 SSD',
            description: 'Step-by-step guide to upgrade your laptop storage.',
            time: '15 min',
            difficulty: 'Easy',
            difficultyColor: Colors.green,
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_fan.jpg',
            title: 'Fixing Laptop Fan Noise',
            description: 'A guide to quietening your noisy laptop fan.',
            time: '25 min',
            difficulty: 'Medium',
            difficultyColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  // ⭐ NEW SECTION: Method to build the Replacement Guides section
  Widget _buildReplacementGuides() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Replacement Guides',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Hot',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_battery.jpg',
            title: 'MacBook Pro Battery Replacement',
            description: 'A detailed guide for replacing the battery on a MacBook Pro.',
            time: '45 min',
            difficulty: 'Hard',
            difficultyColor: Colors.red,
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_keyboard.jpg',
            title: 'Keyboard Replacement on Dell Laptop',
            description: 'How to replace a faulty or unresponsive laptop keyboard.',
            time: '60 min',
            difficulty: 'Medium',
            difficultyColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  // ⭐ NEW SECTION: Method to build the Maintenance & Fixes section
  Widget _buildMaintenanceAndFixes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Maintenance & Fixes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_thermal.jpg',
            title: 'Laptop Thermal Paste Application',
            description: 'A step-by-step tutorial on applying thermal paste.',
            time: '30 min',
            difficulty: 'Medium',
            difficultyColor: Colors.orange,
          ),
          const SizedBox(height: 15),
          _buildTutorialCard(
            imagePath: 'assets/images/laptop_screen.jpg',
            title: 'Laptop Screen Pixel Fix',
            description: 'A guide to fixing stuck or dead pixels on your laptop screen.',
            time: '10 min',
            difficulty: 'Easy',
            difficultyColor: Colors.green,
          ),
        ],
      ),
    );
  }

  // ⭐ NEW SECTION: Helper method for the Community Highlights section
  Widget _buildCommunityHighlights() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Community Highlights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/maria.jpg'),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Success Story',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Mark repaired his laptop using a DIY tutorial – saved ₱7,500!',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Eco-Saver',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.storefront, color: Colors.blue.shade700, size: 30),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shop Highlight',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'GreenTech Repair Hub helped 200+ users this month!',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Share Your Story',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ⭐ NEW SECTION: Helper method for the tutorial cards
  Widget _buildTutorialCard({
    required String imagePath,
    required String title,
    required String description,
    required String time,
    required String difficulty,
    required Color difficultyColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
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
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: difficultyColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          difficulty,
                          style: TextStyle(
                            color: difficultyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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