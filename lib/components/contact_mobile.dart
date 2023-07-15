import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/form_field.dart';
import 'package:http/http.dart' as http;

class ContactMobile extends StatefulWidget {
  ContactMobile({Key? key}) : super(key: key);

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final messageController = TextEditingController();

  void onListen() => setState(() {});

  @override
  initState() {
    super.initState();
    emailController.addListener(onListen);
    nameController.addListener(onListen);
    messageController.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    messageController.dispose();

    emailController.removeListener(onListen);
    nameController.removeListener(onListen);
    messageController.removeListener(onListen);
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
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contact Me',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: CustomFormField(
                    text: 'NAME',
                    controller: nameController,
                    invalidText: 'Enter your name',
                    formType: 'name',
                    textInputType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: emailController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () => emailController.clear(),
                            ),
                      label: const Text(
                        'EMAIL',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: CustomFormField(
                    text: 'WRITE YOUR MESSAGE...',
                    controller: messageController,
                    invalidText: 'Enter your message',
                    formType: 'message',
                    textInputType: TextInputType.multiline,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  isSent == true ? messageResponse : '',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
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
                      child: Container(
                        width: 268,
                        height: 72,
                        decoration: ShapeDecoration(
                          color: Color(0xFF8873EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'SEND MESSAGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Suez One',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: const [
              Icon(
                Icons.email,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'echatahkingdavid@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
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
                color: Colors.black,
                size: 25,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  '+234 902 902 6157',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
