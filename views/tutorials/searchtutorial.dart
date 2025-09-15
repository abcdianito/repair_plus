import 'package:flutter/material.dart';

// Assuming you have a home_screen.dart file in the specified path
// You will need to create this file to make the navigation work.
import '/views/dashboard.dart';

// Enum for tutorial difficulty to handle styling
enum Difficulty { easy, medium, advanced }

// A reusable widget for the tutorial cards
class TutorialCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String duration;
  final Difficulty difficulty;

  const TutorialCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color difficultyColor;
    String difficultyText;
    switch (difficulty) {
      case Difficulty.easy:
        difficultyColor = const Color(0xFFB9F6CA);
        difficultyText = 'Easy';
        break;
      case Difficulty.medium:
        difficultyColor = Colors.orange.shade200;
        difficultyText = 'Medium';
        break;
      case Difficulty.advanced:
        difficultyColor = Colors.red.shade200;
        difficultyText = 'Advanced';
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath,
                width: 100,
                height: 100,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Using Expanded to ensure both sections share space proportionally
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Flexible( // Using Flexible to prevent text overflow
                              child: Text(
                                duration,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // The difficulty tag is also expanded to share space
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: difficultyColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            difficultyText,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center, // Center text inside
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text(
                        'View Tutorial',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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

class SearchTutorialView extends StatefulWidget {
  const SearchTutorialView({Key? key}) : super(key: key);

  @override
  _SearchTutorialViewState createState() => _SearchTutorialViewState();
}

class _SearchTutorialViewState extends State<SearchTutorialView> {
  final List<String> _filters = ['All', 'Easy', 'Medium', 'Advanced', 'Newest'];
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF10B981),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Find A Guide',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search tutorials...',
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
          SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = filter == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedFilter = filter;
                        }
                      });
                    },
                    backgroundColor: isSelected ? const Color(0xFF10B981) : Colors.grey.shade200,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                TutorialCard(
                  imagePath: 'assets/images/replace.jpg',
                  title: 'Phone Screen Replacement',
                  description: 'Fix cracked screens with this step-by-step guide.',
                  duration: '15 min read',
                  difficulty: Difficulty.medium,
                ),
                TutorialCard(
                  imagePath: 'assets/images/replace.jpg',
                  title: 'Battery Replacement Guide',
                  description: 'Replace your phone battery to improve performance and life.',
                  duration: '20 min read',
                  difficulty: Difficulty.easy,
                ),
                TutorialCard(
                  imagePath: 'assets/images/replace.jpg',
                  title: 'Charging Port Repair',
                  description: 'Fix charging issues by replacing damaged ports.',
                  duration: '30 min read',
                  difficulty: Difficulty.advanced,
                ),
                TutorialCard(
                  imagePath: 'assets/images/replace.jpg',
                  title: 'Charging Port Repair',
                  description: 'Fix charging issues by replacing damaged ports.',
                  duration: '30 min read',
                  difficulty: Difficulty.advanced,
                ),
                TutorialCard(
                  imagePath: 'assets/images/replace.jpg',
                  title: 'Charging Port Repair',
                  description: 'Fix charging issues by replacing damaged ports.',
                  duration: '30 min read',
                  difficulty: Difficulty.advanced,
                ),
              ],
            ),
          ),
        ],
      ),
      // The bottomNavigationBar has been removed
    );
  }
}