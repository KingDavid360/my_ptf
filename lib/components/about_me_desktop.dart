import 'package:flutter/material.dart';
import 'package:portfolio/components/url_launcher.dart';

class AboutMeDesktop extends StatelessWidget {
  AboutMeDesktop({Key? key}) : super(key: key);
  final LaunchUrl launchUrl = LaunchUrl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF1E293B),
      width: double.infinity,
      height: double.infinity,
      // Added SingleChildScrollView to fix vertical overflow
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Changed mainAxisSize to min to prevent overflow
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section Header
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Section Title
                const Text(
                  'About Me',
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
                    'Get to know more about me and my journey as a developer',
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

            // About Me Content - Changed to LayoutBuilder for responsiveness
            LayoutBuilder(
              builder: (context, constraints) {
                // For narrower screens, use a vertical layout
                if (constraints.maxWidth < 900) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile Photo
                      _buildProfilePhoto(size),
                      const SizedBox(height: 50),
                      // About Me Text and Timeline
                      _buildAboutContent(),
                    ],
                  );
                } else {
                  // For wider screens, use horizontal layout
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Photo
                      Expanded(
                        flex: 2,
                        child: _buildProfilePhoto(size),
                      ),

                      const SizedBox(width: 40),

                      // About Me Text and Timeline
                      Expanded(
                        flex: 3,
                        child: _buildAboutContent(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Extracted profile photo to separate method for reusability
  Widget _buildProfilePhoto(Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background Elements
        Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            color: const Color(0xFF38BDF8).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
        ),

        // Decorative Border
        Container(
          width: 300,
          height: 300,
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
            size: const Size.fromRadius(130),
            child: Image.asset(
              'images/profile_photo.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Experience Badge
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF38BDF8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.code,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  '3+ Years Experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Extracted about content to separate method for reusability
  Widget _buildAboutContent() {
    return Container(
      padding: const EdgeInsets.all(30),
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
        mainAxisSize: MainAxisSize.min,
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
                'Who I Am',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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

          const SizedBox(height: 20),

          // Journey Section Title
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
                'My Journey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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

          const SizedBox(height: 30),

          // Download CV Button
          Center(
            child: GestureDetector(
              onTap: () => launchUrl.launchURLBrowser(
                'https://drive.google.com/file/d/1JVYTTVbpHRwRQgSVsUUVC2Ib76sxtHmC/view?usp=sharing',
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        // Timeline Line and Dot
        Column(
          mainAxisSize: MainAxisSize.min,
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
            mainAxisSize: MainAxisSize.min,
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
