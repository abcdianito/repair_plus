import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section: Profile Header
            _buildProfileHeader(),
            const SizedBox(height: 20),
            // Middle Section: Stat Cards
            _buildStatCards(),
            const SizedBox(height: 20),
            // Bottom Section: Account Settings
            _buildAccountSettings(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      // Updated with a green gradient background
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF10B981), // A darker green
            Color(0xFFB0F6BA), // A lighter green
          ],
        ),
      ),
      child: Row(
        children: [
          // Profile Image
          Stack(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile_sarah.jpg'), // Placeholder for profile image
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Name and Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Sarah Johnson',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Changed to white for visibility
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'sarah.j@email.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70, // Changed to white for visibility
                  ),
                ),
              ],
            ),
          ),
          // Edit Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Edit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF10B981),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFF10B981)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: const [
          _StatCard(
            title: 'Tutorials',
            count: 24,
            icon: Icons.article,
            color: Color(0xFFB0F6BA),
          ),
          _StatCard(
            title: 'Shops',
            count: 12,
            icon: Icons.store,
            color: Color(0xFFB0F6BA),
          ),
          _StatCard(
            title: 'Recycled',
            count: 8,
            icon: Icons.recycling,
            color: Color(0xFFB0F6BA),
          ),
          _StatCard(
            title: 'Reviews',
            count: 16,
            icon: Icons.star_border,
            color: Color(0xFFB0F6BA),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          _SettingsItem(
            title: 'Edit Profile',
            icon: Icons.person_outline,
            onTap: () {},
          ),
          _SettingsItem(
            title: 'Change Password',
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          _SettingsItem(
            title: 'Connected Devices',
            icon: Icons.devices,
            onTap: () {},
          ),
          _SettingsItem(
            title: 'Theme Preferences',
            icon: Icons.palette_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF10B981)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF10B981),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFB0F6BA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF10B981)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
