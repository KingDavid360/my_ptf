import 'package:flutter/material.dart';
import 'package:portfolio/components/screen_detector.dart';
import 'package:portfolio/components/url_launcher.dart';

class AboutMeMobile extends StatelessWidget {
  AboutMeMobile({Key? key}) : super(key: key);
  final LaunchUrl launchUrl = LaunchUrl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                'About Me',
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

          // Profile Photo with Decorative Elements
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background Elements
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF38BDF8).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),

                // Decorative Border
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF38BDF8),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),

                // Profile Photo
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(90),
                    child: Image.asset(
                      'images/profile_photo.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // About Me Content
          Container(
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
                // Introduction Header
                const Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xFF38BDF8),
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Who I am',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Bio Text
                const Text(
                  'My name is Echatah KingDavid, a Flutter developer with a passion for creating elegant mobile solutions. My curiosity and problem-solving mindset drive me to continuously improve and take on new challenges.',
                  style: TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 24),

                // Journey Header
                const Row(
                  children: [
                    Icon(
                      Icons.timeline,
                      color: Color(0xFF38BDF8),
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'My Journey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Journey Timeline
                const _TimelineItem(
                  year: '2020',
                  title: 'Started Programming',
                  description:
                      'Began my programming journey with C, learning the fundamentals of software development.',
                ),

                const _TimelineItem(
                  year: '2021',
                  title: 'Explored OOP with Java',
                  description:
                      'Advanced my skills by learning object-oriented programming principles through Java.',
                ),

                const _TimelineItem(
                  year: '2022',
                  title: 'Flutter & Dart',
                  description:
                      'Discovered my passion for mobile development with Flutter and Dart, building cross-platform applications.',
                ),

                const _TimelineItem(
                  year: '2023 - Present',
                  title: 'Advanced Developer',
                  description:
                      'Working on complex projects and continuously expanding my skills in mobile and backend development.',
                  isLast: true,
                ),

                const SizedBox(height: 32),

                // Download CV Button
                Center(
                  child: GestureDetector(
                    onTap: () => launchUrl.launchURLBrowser(
                      'https://drive.google.com/file/d/1JVYTTVbpHRwRQgSVsUUVC2Ib76sxtHmC/view?usp=sharing',
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF38BDF8).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Download CV',
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

// Timeline Item Component
class _TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final bool isLast;

  const _TimelineItem({
    required this.year,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Line and Dot
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF0F172A),
                  width: 3,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 80,
                color: const Color(0xFF38BDF8).withOpacity(0.3),
              ),
          ],
        ),

        const SizedBox(width: 16),

        // Timeline Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Year
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  year,
                  style: const TextStyle(
                    color: Color(0xFF38BDF8),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 6),

              // Description
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
            ],
          ),
        ),
      ],
    );
  }
}
