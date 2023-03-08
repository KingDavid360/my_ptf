import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final String text;
  final String invalidText;
  final TextEditingController controller;
  final String formType;
  final TextInputType textInputType;

  const CustomFormField(
      {super.key,
      required this.text,
      required this.controller,
      required this.invalidText,
      required this.formType,
      required this.textInputType});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      validator: (formType) => formType!.isNotEmpty ? null : widget.invalidText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        label: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => widget.controller.clear(),
              ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
      ),
    );
  }
}
