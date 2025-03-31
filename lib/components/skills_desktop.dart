import 'package:flutter/material.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF0F172A),
      child: SingleChildScrollView(
        // Added SingleChildScrollView to prevent overflow
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 80),
        child: Column(
          children: [
            // Section Header
            Column(
              children: [
                // Section Title
                const Text(
                  'My Skills',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 16),

                // Section Description
                SizedBox(
                  width: size.width * 0.6,
                  child: const Text(
                    'Technologies and tools I work with to create amazing applications',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Decorative Element
                Container(
                  height: 4,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF38BDF8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // Skills Categories
            // Using Column instead of Row to avoid horizontal overflow
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mobile Development Skills
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: SkillCategory(
                    title: 'Mobile Development',
                    skills: [
                      SkillData(
                        icon: 'images/flutter_logo.png',
                        name: 'Flutter',
                        level: 0.9,
                      ),
                      SkillData(
                        icon: 'images/dart_logo.png',
                        name: 'Dart',
                        level: 0.85,
                      ),
                      SkillData(
                        icon: 'images/android_logo.png',
                        name: 'Android',
                        level: 0.6,
                      ),
                      SkillData(
                        icon: 'images/java_logo.png',
                        name: 'Java',
                        level: 0.7,
                      ),
                    ],
                  ),
                ),

                // Backend & Database Skills
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: SkillCategory(
                    title: 'Backend & Database',
                    skills: [
                      SkillData(
                        icon: 'images/firebase_logo.png',
                        name: 'Firebase',
                        level: 0.8,
                      ),
                      SkillData(
                        icon: 'images/python.png',
                        name: 'Python',
                        level: 0.5,
                      ),
                      SkillData(
                        icon: 'images/dj.png',
                        name: 'Django',
                        level: 0.6,
                      ),
                    ],
                  ),
                ),

                // Tools & Other Skills
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: SkillCategory(
                    title: 'Tools & Others',
                    skills: [
                      SkillData(
                        icon: 'images/git_logo.png',
                        name: 'Git',
                        level: 0.85,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Additional Skills and Frameworks
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Frameworks & Libraries',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Using Wrap widget to handle overflow gracefully
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _FrameworkChip(name: 'Provider'),
                      _FrameworkChip(name: 'Bloc'),
                      _FrameworkChip(name: 'GetX'),
                      _FrameworkChip(name: 'Google Maps'),
                      _FrameworkChip(name: 'Firebase Auth'),
                      _FrameworkChip(name: 'Firestore'),
                      _FrameworkChip(name: 'REST APIs'),
                      _FrameworkChip(name: 'SQLite'),
                      _FrameworkChip(name: 'Shared Preferences'),
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

class SkillCategory extends StatelessWidget {
  final String title;
  final List<SkillData> skills;

  const SkillCategory({
    Key? key,
    required this.title,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Title
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 30),

        // Skills List
        ...skills.map((skill) => SkillBar(
              icon: skill.icon,
              name: skill.name,
              level: skill.level,
            )),
      ],
    );
  }
}

class SkillData {
  final String icon;
  final String name;
  final double level;

  SkillData({
    required this.icon,
    required this.name,
    required this.level,
  });
}

class SkillBar extends StatelessWidget {
  final String icon;
  final String name;
  final double level;

  const SkillBar({
    Key? key,
    required this.icon,
    required this.name,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine max width for the row
    final screenWidth = MediaQuery.of(context).size.width;
    final maxBarWidth =
        screenWidth * 0.6; // Limiting the width to 60% of screen

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        // Changed to start to prevent overflow issues
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Skill Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              icon,
              width: 40, // Reduced size to prevent overflow
              height: 40,
            ),
          ),

          const SizedBox(width: 20),

          // Skill Info and Progress Bar
          // Wrap in Expanded to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skill Name and Percentage
                Row(
                  // Changed to spaceBetween but wrapped in constraints
                  // to prevent overflow
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Limit name width to prevent overflow
                    Flexible(
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '${(level * 100).toInt()}%',
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Progress Bar
                Stack(
                  children: [
                    // Background
                    Container(
                      width:
                          double.infinity, // Let parent Expanded control width
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    // Progress
                    FractionallySizedBox(
                      widthFactor: level,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(5),
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
    );
  }
}

class _FrameworkChip extends StatelessWidget {
  final String name;

  const _FrameworkChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF38BDF8)),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Color(0xFF38BDF8),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
