import 'package:flutter/material.dart';
import 'package:portfolio/components/url_launcher.dart';

class PortfolioMobile extends StatelessWidget {
  PortfolioMobile({Key? key}) : super(key: key);

  final LaunchUrl launchUrl = LaunchUrl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
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
                  'Featured Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Project 1 - Payment App
            ProjectCard(
              title: 'Gonana App',
              description:
                  'Gonana is a unique and web3 enabled marketplace for commodity traders worldwide, its innovative technology stack enables seamless interaction for local and international traders to connect and conduct business transparently by leveraging the power of Blockchain technology.',
              imagePath:
                  'images/gonana.jpg', // Replace with your first project image
              technologies: ['Flutter', 'Dart', 'Firebase', 'GetX'],
              onTap: () => launchUrl.launchURLBrowser(
                  'https://apps.apple.com/ng/app/gonana/id6736833379'),
            ),

            const SizedBox(height: 40),

            // Project 2 - Ride Sharing App
            ProjectCard(
              title: 'Bloomrydes app',
              description:
                  'A ride-sharing application that connects drivers and passengers, featuring real-time location tracking, secure payments, and an intuitive UI.',
              imagePath:
                  'images/bloom.jpg', // Replace with your second project image
              technologies: [
                'Flutter',
                'Provider',
                'Google Maps API',
                'Firebase'
              ],
              onTap: () => launchUrl.launchURLBrowser(
                  'https://apps.apple.com/ng/app/bloomrydes/id1491366935'),
            ),

            const SizedBox(height: 40),

            // Project 3 - Healthcare App
            ProjectCard(
              title: 'Healthcare Appointment System',
              description:
                  'A comprehensive healthcare application that allows patients to book appointments with specialists, view medical records, and receive telemedicine services.',
              imagePath:
                  'images/clinic.jpg', // Replace with your third project image
              technologies: ['Flutter', 'Bloc', 'REST API', 'WebRTC'],
              onTap: () => launchUrl.launchURLBrowser(
                  'https://github.com/KingDavid360/Doctors-clinic'),
            ),

            const SizedBox(height: 40),

            // Project 4 - Mechanic Service App
            ProjectCard(
              title: 'Ngbuka app ',
              description:
                  'An application that connects vehicle owners with mechanics and auto part dealers. Features include service booking, parts ordering, and repair tracking.',
              imagePath:
                  'images/ngbuka.jpg', // Replace with your fourth project image
              technologies: ['Flutter', 'Firebase', 'Google Maps', 'Stripe'],
              onTap: () => launchUrl.launchURLBrowser(
                  'https://apps.apple.com/ng/app/ngbuka/id6739790851'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final VoidCallback onTap;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Technologies Used
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: technologies
                      .map((tech) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xFF38BDF8)),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                color: Color(0xFF38BDF8),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))
                      .toList(),
                ),

                const SizedBox(height: 20),

                // View Project Button
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF38BDF8)),
                    ),
                    child: const Center(
                      child: Text(
                        'View Project',
                        style: TextStyle(
                          color: Color(0xFF38BDF8),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
