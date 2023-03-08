import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'buttons.dart';
import 'form_field.dart';
import 'package:http/http.dart' as http;

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

  void onListen() => setState(() {});

  @override
  initState() {
    super.initState();
    emailController.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.dispose();
    emailController.removeListener(onListen);
    super.dispose();
  }

  Future sendEmail() async {
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
    print(response.body);
  }

  String messageResponse = 'MESSAGE SENT SUCCESSFULLY';
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Contact Me',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: CustomFormField(
                    invalidText: 'Enter your name',
                    text: 'NAME',
                    controller: nameController,
                    formType: 'name',
                    textInputType: TextInputType.name,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: TextFormField(
                    controller: emailController,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: emailController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () => emailController.clear(),
                            ),
                      label: const Text(
                        'EMAIL',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.3),
              child: CustomFormField(
                text: 'WRITE YOUR MESSAGE...',
                controller: messageController,
                invalidText: 'Enter your message',
                formType: 'message',
                textInputType: TextInputType.text,
              ),
            ),
            SizedBox(height: 5),
            Text(
              isSent == true ? messageResponse : '',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.3),
              child: InkWell(
                  onTap: () async {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      final email = emailController.text;
                      final name = nameController.text;
                      final message = messageController.text;
                      await sendEmail();
                      setState(() {
                        isSent = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          messageResponse = '';
                        });
                      });
                      emailController.clear();
                      nameController.clear();
                      messageController.clear();
                    }
                  },
                  child: Buttons(text: 'SEND MESSAGE')),
            ),
            SizedBox(height: 40),
            Row(
              children: const [
                Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 25,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'echatahkingdavid@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: const [
                Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 25,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    '+234 902 902 6157',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
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
