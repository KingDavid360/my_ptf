import 'package:flutter/material.dart';

class ProjectsContainer extends StatelessWidget {
  final String title;
  final String text;

  const ProjectsContainer({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(
            color: Colors.grey.shade800, //                   <--- border color
            width: 5.0,
          )),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, top: 25, bottom: 25, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                child: Image.asset(
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    'images/github.png'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.grey),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
