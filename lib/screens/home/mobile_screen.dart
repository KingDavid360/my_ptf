import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_mobile.dart';
import 'package:portfolio/components/contact_mobile.dart';
import 'package:portfolio/components/portfolio_mobile.dart';
import 'package:portfolio/components/projects_mobile.dart';
import 'package:portfolio/components/skills_mobile.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Background container
        Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFF1E293B), // Darker blue background
        ),

        // Gradient overlay for visual interest
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
            ),
          ),
        ),

        // Content
        ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 60, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello 👋🏾, I'm King David",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFFE2E8F0),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mobile Application \nDeveloper',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFFF8FAFC),
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color(0xFF38BDF8), // Light blue accent
                          width: 3,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "'I'm a passionate software developer focused on creating elegant solutions to complex problems. I build cross-platform applications with Flutter and Dart.",
                        style: TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    onTap: () => _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOutCubic,
                    ),
                    child: Container(
                      width: 200,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF38BDF8).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Get in touch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 90),
            PortfolioMobile(),
            MoreProjectsMobile(),
            const SizedBox(height: 90),
            SkillsMobile(),
            const SizedBox(height: 90),
            AboutMeMobile(),
            const SizedBox(height: 90),
            ContactMobile(),
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF0F172A),
              child: Center(
                child: Text(
                  '© ${DateTime.now().year} King David | Flutter Developer',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
