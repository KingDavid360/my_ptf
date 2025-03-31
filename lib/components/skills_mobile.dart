import 'package:flutter/material.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Container(
                height: 30,
                width: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'My Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'Technologies and tools I work with',
            style: TextStyle(
              color: Color(0xFFCBD5E1),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 40),

          // Skills Categories
          const Text(
            'Mobile Development',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          // Mobile Development Skills
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              SkillCard(
                icon: 'images/flutter_logo.png',
                name: 'Flutter',
                level: 1,
              ),
              SkillCard(
                icon: 'images/dart_logo.png',
                name: 'Dart',
                level: 0.9,
              ),
              SkillCard(
                icon:
                    'images/android_logo.png', // You'll need to add this asset
                name: 'Android',
                level: 0.6,
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Backend Skills Category
          const Text(
            'Backend & Database',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          // Backend Skills
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              SkillCard(
                icon: 'images/firebase_logo.png',
                name: 'Firebase',
                level: 0.8,
              ),
              SkillCard(
                icon: 'images/python.png',
                name: 'Python',
                level: 0.5,
              ),
              SkillCard(
                icon: 'images/dj.png',
                name: 'Django',
                level: 0.6,
              ),
              SkillCard(
                icon: 'images/java_logo.png',
                name: 'Java',
                level: 0.7,
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Tools Category
          const Text(
            'Tools & Others',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          // Tools Skills
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              SkillCard(
                icon: 'images/git_logo.png',
                name: 'Git',
                level: 0.85,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String icon;
  final String name;
  final double level;

  const SkillCard({
    Key? key,
    required this.icon,
    required this.name,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Skill Icon
          Image.asset(
            icon,
            height: 50,
            width: 50,
          ),

          const SizedBox(height: 12),

          // Skill Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          // Skill Level Indicator
          LinearProgressIndicator(
            value: level,
            backgroundColor: const Color(0xFF0F172A),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF38BDF8)),
            borderRadius: BorderRadius.circular(4),
            minHeight: 6,
          ),

          const SizedBox(height: 8),

          // Skill Level Text
          Text(
            '${(level * 100).toInt()}%',
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
