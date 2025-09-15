import 'package:flutter/material.dart';

// Custom Widget for a Shop Card
class ShopCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String distance;
  final String services;
  final String status;
  final VoidCallback onCall;
  final VoidCallback onWebsite;
  final VoidCallback onDirections;

  const ShopCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.distance,
    required this.services,
    required this.status,
    required this.onCall,
    required this.onWebsite,
    required this.onDirections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOpen = status == 'Open';
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isOpen ? const Color(0xFFE8F5E9) : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: isOpen ? const Color(0xFF4CAF50) : Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '$rating',
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.location_on, color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            distance,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        services,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.call, 'Call', onCall),
                _buildActionButton(Icons.public, 'Website', onWebsite),
                _buildActionButton(Icons.directions, 'Directions', onDirections),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            children: [
              Icon(icon, color: const Color(0xFF10B981)),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(color: const Color(0xFF10B981), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The main screen widget
class ShopsScreen extends StatefulWidget {
  const ShopsScreen({Key? key}) : super(key: key);

  @override
  _ShopsScreenState createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  // Dummy shop data with all images pointing to the single asset
  final List<Map<String, dynamic>> _shops = [
    {
      'name': 'Maewa Repair Shop',
      'image': 'assets/images/maps.png',
      'rating': 4.5,
      'distance': '1.2 km',
      'services': 'Phone Repair',
      'status': 'Open',
    },
    {
      'name': 'TechFix Electronics',
      'image': 'assets/images/maps.png',
      'rating': 4.8,
      'distance': '2.1 km',
      'services': 'Laptop Repair, Gaming',
      'status': 'Closed',
    },
    {
      'name': 'Gadget Gurus',
      'image': 'assets/images/maps.png',
      'rating': 4.2,
      'distance': '0.7 km',
      'services': 'Tablet Repair, Accessories',
      'status': 'Open',
    }
  ];

  void _makePhoneCall() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Call feature not implemented.')),
    );
  }

  void _launchWebsite() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Website feature not implemented.')),
    );
  }

  void _launchDirections() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Directions feature not implemented.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('RePair+ Shops'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3, // Map takes 3 parts of available space
            child: Stack(
              children: [
                // Correctly referencing the local map image asset
                Image.asset(
                  'assets/images/maps.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('My Location feature not active.')),
                      );
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey[800],
                    mini: true,
                    child: const Icon(Icons.my_location),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      '12 shops nearby',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search a shop...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_list, color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended Shops',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _shops.length,
              itemBuilder: (context, index) {
                final shop = _shops[index];
                return ShopCard(
                  name: shop['name'],
                  imagePath: shop['image'],
                  rating: shop['rating'],
                  distance: shop['distance'],
                  services: shop['services'],
                  status: shop['status'],
                  onCall: _makePhoneCall,
                  onWebsite: _launchWebsite,
                  onDirections: _launchDirections,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}