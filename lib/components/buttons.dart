import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;

  const Buttons({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white, //                   <--- border color
          width: 2.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
