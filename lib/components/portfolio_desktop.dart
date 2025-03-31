import 'package:flutter/material.dart';
import 'package:portfolio/components/url_launcher.dart';

class PortfolioDesktop extends StatelessWidget {
  PortfolioDesktop({Key? key}) : super(key: key);
  final LaunchUrl launchUrl = LaunchUrl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF1E293B),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Header
            Column(
              children: [
                // Section Title
                const Text(
                  'Featured Projects',
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
                    'Here are some of my best projects that showcase my skills and experience',
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

            // Project 1 - Payment App
            ProjectSection(
              title: 'Gonana App',
              description:
                  'Gonana is a unique and web3 enabled marketplace for commodity traders worldwide, its innovative technology stack enables seamless interaction for local and international traders to connect and conduct business transparently by leveraging the power of Blockchain technology.',
              imagePath: 'images/gonana.jpg',
              technologies: ['Flutter', 'Dart', 'Firebase', 'GetX'],
              isImageLeft: true,
              githubUrl: 'https://apps.apple.com/ng/app/gonana/id6736833379',
              launchUrl: launchUrl,
            ),

            const SizedBox(height: 100),

            // Project 2 - Ride Sharing App
            ProjectSection(
              title: 'Bloomrydes app',
              description:
                  'A ride-sharing application that connects drivers and passengers, featuring real-time location tracking, secure payments, and an intuitive UI. The app provides ride scheduling, driver ratings, and route optimization to create a seamless experience.',
              imagePath: 'images/bloom.jpg',
              technologies: [
                'Flutter',
                'Provider',
                'Google Maps API',
                'Firebase'
              ],
              isImageLeft: false,
              githubUrl:
                  'https://apps.apple.com/ng/app/bloomrydes/id1491366935',
              launchUrl: launchUrl,
            ),

            const SizedBox(height: 100),

            // Project 3 - Healthcare App
            ProjectSection(
              title: 'Healthcare Appointment System',
              description:
                  'A comprehensive healthcare application that allows patients to book appointments with specialists, view medical records, and receive telemedicine services. The app features doctor profiles, appointment scheduling, and secure messaging.',
              imagePath: 'images/clinic.jpg',
              technologies: ['Flutter', 'Bloc', 'REST API', 'WebRTC'],
              isImageLeft: true,
              githubUrl: 'https://github.com/KingDavid360/Doctors-clinic',
              launchUrl: launchUrl,
            ),

            const SizedBox(height: 100),

            // Project 4 - Mechanic Service App
            ProjectSection(
              title: 'Ngbuka app',
              description:
                  'An application that connects vehicle owners with mechanics and auto part dealers. Features include service booking, parts ordering, and repair tracking. The platform streamlines the process of finding reliable automotive services.',
              imagePath: 'images/ngbuka.jpg',
              technologies: ['Flutter', 'Firebase', 'Google Maps', 'Stripe'],
              isImageLeft: false,
              githubUrl: 'https://apps.apple.com/ng/app/ngbuka/id6739790851',
              launchUrl: launchUrl,
            ),

            const SizedBox(height: 100),

            // More Projects Section
            Column(
              children: [
                const Text(
                  'More Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 50),

                // Project Grid
                Row(
                  children: [
                    // Twitter Clone
                    Expanded(
                      child: _CompactProjectCard(
                        icon: Icons.chat_bubble_outline,
                        title: 'Twitter Clone',
                        description:
                            'A fully functional Twitter clone built with Flutter and Firebase.',
                        tags: ['Flutter', 'Firebase', 'Social Media'],
                        githubUrl: 'https://github.com/KingDavid360/tweeter',
                        launchUrl: launchUrl,
                      ),
                    ),

                    const SizedBox(width: 30),

                    // Weather App
                    Expanded(
                      child: _CompactProjectCard(
                        icon: Icons.cloud_outlined,
                        title: 'Weather App',
                        description:
                            'A sleek weather application with hourly and daily forecasts.',
                        tags: ['Flutter', 'Weather API', 'Animations'],
                        githubUrl:
                            'https://github.com/KingDavid360/weather_app',
                        launchUrl: launchUrl,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    // Country App
                    Expanded(
                      child: _CompactProjectCard(
                        icon: Icons.public,
                        title: 'Country Explorer',
                        description:
                            'An app that displays information about all countries including flags, languages, and currencies.',
                        tags: ['Flutter', 'REST API', 'UI/UX'],
                        githubUrl:
                            'https://github.com/KingDavid360/Country_App',
                        launchUrl: launchUrl,
                      ),
                    ),

                    const SizedBox(width: 30),

                    // Fantasy Football App
                    Expanded(
                      child: _CompactProjectCard(
                        icon: Icons.sports_soccer,
                        title: 'Fantasy Football App',
                        description:
                            'A fantasy football gaming app designed with Flutter.',
                        tags: ['Flutter', 'UI/UX', 'Sports'],
                        githubUrl:
                            'https://github.com/KingDavid360/abuad-footbal-league',
                        launchUrl: launchUrl,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // View All Projects Button
                GestureDetector(
                  onTap: () => launchUrl.launchURLBrowser(
                      'https://github.com/KingDavid360?tab=repositories'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF38BDF8), width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.code,
                          color: Color(0xFF38BDF8),
                          size: 20,
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
          ],
        ),
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final bool isImageLeft;
  final String githubUrl;
  final LaunchUrl launchUrl;

  const ProjectSection({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    required this.isImageLeft,
    required this.githubUrl,
    required this.launchUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Project Image or Details based on isImageLeft
        if (isImageLeft) _buildProjectImage(),

        const SizedBox(width: 50),

        // Project Details or Image based on isImageLeft
        if (isImageLeft) _buildProjectDetails() else _buildProjectImage(),

        if (!isImageLeft) const SizedBox(width: 50),

        if (!isImageLeft) _buildProjectDetails(),
      ],
    );
  }

  Expanded _buildProjectImage() {
    return Expanded(
      flex: 5,
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Expanded _buildProjectDetails() {
    return Expanded(
      flex: 7,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
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
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Project Description
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 16,
                fontFamily: 'Poppins',
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // Technologies Used
            const Text(
              'Technologies Used',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            // Tech Tags
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: technologies
                  .map((tech) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xFF38BDF8)),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            color: Color(0xFF38BDF8),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 30),

            // View Project Button
            GestureDetector(
              onTap: () => launchUrl.launchURLBrowser(githubUrl),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF38BDF8).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'View Project',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => launchUrl.launchURLBrowser(githubUrl),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.code,
                        color: Colors.white,
                        size: 20,
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

class _CompactProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final LaunchUrl launchUrl;

  const _CompactProjectCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
    required this.githubUrl,
    required this.launchUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl.launchURLBrowser(githubUrl),
      child: Container(
        padding: const EdgeInsets.all(30),
        height: 300,
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF38BDF8),
                size: 32,
              ),
            ),

            const SizedBox(height: 20),

            // Project Title
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
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

            const Spacer(),

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
      ),
    );
  }
}
