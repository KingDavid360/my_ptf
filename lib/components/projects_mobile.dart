import 'package:flutter/material.dart';
import 'package:portfolio/components/url_launcher.dart';

class MoreProjectsMobile extends StatelessWidget {
  MoreProjectsMobile({Key? key}) : super(key: key);

  final LaunchUrl launchUrl = LaunchUrl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E293B),
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
                'Other Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Here are some other projects I\'ve worked on',
            style: TextStyle(
              color: Color(0xFFCBD5E1),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),

          // Twitter Clone Project
          GestureDetector(
            onTap: () => launchUrl
                .launchURLBrowser('https://github.com/KingDavid360/tweeter'),
            child: const ProjectCard(
              icon: Icons.chat_bubble_outline,
              title: 'Twitter Clone',
              description:
                  'A fully functional Twitter clone built with Flutter and Firebase. Features include account creation, authentication, tweeting, likes, comments, and real-time updates.',
              tags: ['Flutter', 'Firebase', 'Social Media'],
            ),
          ),

          const SizedBox(height: 24),

          // Weather App Project
          GestureDetector(
            onTap: () => launchUrl.launchURLBrowser(
                'https://github.com/KingDavid360/weather_app'),
            child: const ProjectCard(
              icon: Icons.cloud_outlined,
              title: 'Weather App',
              description:
                  'A sleek weather application that provides hourly and daily forecasts based on your current location. Features beautiful animations and a clean, intuitive interface.',
              tags: ['Flutter', 'Weather API', 'Animations'],
            ),
          ),

          const SizedBox(height: 24),

          // Country App Project
          GestureDetector(
            onTap: () => launchUrl.launchURLBrowser(
                'https://github.com/KingDavid360/Country_App'),
            child: const ProjectCard(
              icon: Icons.public,
              title: 'Country Explorer',
              description:
                  'An app that displays information about all countries including flags, languages, currencies, and more. Includes search functionality and detailed country profiles.',
              tags: ['Flutter', 'REST API', 'UI/UX'],
            ),
          ),

          const SizedBox(height: 24),

          // Fantasy Football App
          GestureDetector(
            onTap: () => launchUrl.launchURLBrowser(
                'https://github.com/KingDavid360/abuad-footbal-league'),
            child: const ProjectCard(
              icon: Icons.sports_soccer,
              title: 'Fantasy Football App',
              description:
                  'A fantasy football gaming app designed with Flutter. Features player statistics, team management, and league competitions.',
              tags: ['Flutter', 'UI/UX', 'Sports'],
            ),
          ),

          const SizedBox(height: 40),

          // View All Projects Link
          GestureDetector(
            onTap: () => launchUrl.launchURLBrowser(
                'https://github.com/KingDavid360?tab=repositories'),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF38BDF8)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.code,
                    color: Color(0xFF38BDF8),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'View All Projects on GitHub',
                    style: TextStyle(
                      color: Color(0xFF38BDF8),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
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
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;

  const ProjectCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
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
          // Project Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF38BDF8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF38BDF8),
              size: 28,
            ),
          ),

          const SizedBox(height: 16),

          // Project Title
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          // Project Description
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFCBD5E1),
              fontSize: 14,
              fontFamily: 'Poppins',
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // Project Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map((tag) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ))
                .toList(),
          ),

          const SizedBox(height: 16),

          // View Project Link
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'View Project',
                style: TextStyle(
                  color: Color(0xFF38BDF8),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: Color(0xFF38BDF8),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
