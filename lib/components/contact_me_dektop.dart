import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/components/url_launcher.dart';

class ContactMeDesktop extends StatefulWidget {
  ContactMeDesktop({Key? key}) : super(key: key);

  @override
  State<ContactMeDesktop> createState() => _ContactMeDesktopState();
}

class _ContactMeDesktopState extends State<ContactMeDesktop> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final messageController = TextEditingController();

  bool isLoading = false;
  bool isSent = false;
  String messageResponse = '';
  final LaunchUrl launchUrl = LaunchUrl();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    nameController.addListener(() => setState(() {}));
    messageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendEmail() async {
    setState(() {
      isLoading = true;
    });

    try {
      final serviceId = 'service_jmr1k4c';
      final templateId = 'template_egus3pn';
      final userId = 'EydX9EQzZkzFSmqmB';

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': emailController.text,
            'name': nameController.text,
            'message': messageController.text,
          }
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          isSent = true;
          messageResponse =
              'Message sent successfully! I\'ll be in touch soon.';
          isLoading = false;
        });

        // Clear form after successful submission
        emailController.clear();
        nameController.clear();
        messageController.clear();

        // Clear success message after 5 seconds
        Future.delayed(const Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              isSent = false;
              messageResponse = '';
            });
          }
        });
      } else {
        setState(() {
          messageResponse = 'Failed to send message. Please try again later.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        messageResponse = 'An error occurred. Please try again later.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      key: const GlobalObjectKey('contact_section'),
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF0F172A),
      // Added SingleChildScrollView to fix vertical overflow
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: 80,
        ),
        child: Column(
          // Changed to MainAxisSize.min to prevent overflow
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section Header
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Section Title
                const Text(
                  'Get In Touch',
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
                    'Have a project in mind or want to say hello? Feel free to reach out!',
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

            // Contact Form Section - Adding LayoutBuilder for responsiveness
            LayoutBuilder(
              builder: (context, constraints) {
                // For narrow screens, use a vertical layout
                if (constraints.maxWidth < 900) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Contact Form
                      _buildContactForm(),
                      const SizedBox(height: 40),
                      // Contact Information
                      _buildContactInfo(),
                    ],
                  );
                } else {
                  // For wider screens, use horizontal layout
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Form
                      Expanded(
                        flex: 3,
                        child: _buildContactForm(),
                      ),

                      const SizedBox(width: 40),

                      // Contact Information
                      Expanded(
                        flex: 2,
                        child: _buildContactInfo(),
                      ),
                    ],
                  );
                }
              },
            ),

            // Footer
            const SizedBox(height: 80),
            const Text(
              '© 2025 King David | All Rights Reserved',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Extracted contact form to a separate method for reusability
  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Form Title
            const Text(
              'Send Me a Message',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            // Name and Email Fields
            LayoutBuilder(
              builder: (context, constraints) {
                // For very narrow screens, stack fields vertically
                if (constraints.maxWidth < 600) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Name Field
                      _buildNameField(),
                      const SizedBox(height: 20),
                      // Email Field
                      _buildEmailField(),
                    ],
                  );
                } else {
                  // For wider screens, place fields side by side
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Field
                      Expanded(child: _buildNameField()),
                      const SizedBox(width: 20),
                      // Email Field
                      Expanded(child: _buildEmailField()),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 30),

            // Message Field
            TextFormField(
              controller: messageController,
              validator: (value) => value != null && value.isEmpty
                  ? 'Please enter your message'
                  : null,
              maxLines: 6,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              decoration: InputDecoration(
                labelText: 'Your Message',
                alignLabelWithHint: true,
                labelStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF38BDF8),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF38BDF8),
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFF0F172A),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Status Message
            if (messageResponse.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSent
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSent ? Colors.green : Colors.red,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSent ? Icons.check_circle : Icons.error,
                      color: isSent ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        messageResponse,
                        style: TextStyle(
                          color: isSent ? Colors.green : Colors.red,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 30),

            // Submit Button
            GestureDetector(
              onTap: isLoading
                  ? null
                  : () async {
                      if (formKey.currentState!.validate()) {
                        await sendEmail();
                      }
                    },
              child: Container(
                width: 200,
                height: 56,
                decoration: BoxDecoration(
                  gradient: isLoading
                      ? LinearGradient(
                          colors: [
                            const Color(0xFF38BDF8).withOpacity(0.6),
                            const Color(0xFF0284C7).withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : const LinearGradient(
                          colors: [
                            Color(0xFF38BDF8),
                            Color(0xFF0284C7),
                          ],
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
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text(
                          'Send Message',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
    );
  }

  // Name field builder
  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      validator: (value) =>
          value != null && value.isEmpty ? 'Please enter your name' : null,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        labelText: 'Your Name',
        labelStyle: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        prefixIcon: const Icon(
          Icons.person_outline,
          color: Color(0xFF38BDF8),
        ),
        suffixIcon: nameController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Color(0xFF94A3B8),
                  size: 20,
                ),
                onPressed: () => nameController.clear(),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF38BDF8),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF38BDF8),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFF0F172A),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // Email field builder
  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? 'Enter a valid email'
          : null,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        labelText: 'Your Email',
        labelStyle: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Color(0xFF38BDF8),
        ),
        suffixIcon: emailController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Color(0xFF94A3B8),
                  size: 20,
                ),
                onPressed: () => emailController.clear(),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF38BDF8),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF38BDF8),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFF0F172A),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // Extracted contact info to a separate method for reusability
  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Contact Info Title
          const Text(
            'Contact Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 30),

          // Email
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF38BDF8),
                child: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'echatahkingdavid@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Phone
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF38BDF8),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+234 902 902 6157',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Location
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF38BDF8),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Lagos, Nigeria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // Social Media Links
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Find me on',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _SocialButton(
                    icon: Icons.code,
                    onTap: () => launchUrl
                        .launchURLBrowser('https://github.com/KingDavid360'),
                  ),
                  const SizedBox(width: 16),
                  _SocialButton(
                    icon: Icons.dataset_linked_rounded,
                    onTap: () => launchUrl.launchURLBrowser(
                        'https://linkedin.com/in/kingdavid-echatah'),
                  ),
                  const SizedBox(width: 16),
                  _SocialButton(
                    icon: Icons.language,
                    onTap: () => launchUrl
                        .launchURLBrowser('https://twitter.com/KingDavid_Dev'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF38BDF8),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF38BDF8),
          size: 24,
        ),
      ),
    );
  }
}
