import 'package:flutter/material.dart';

class ProjectsContainer extends StatelessWidget {
  final String title;
  final String text;

  const ProjectsContainer({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.black,
      //     borderRadius: const BorderRadius.only(
      //         topRight: Radius.circular(20),
      //         topLeft: Radius.circular(20),
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20)),
      //     border: Border.all(
      //       color: Colors.grey.shade800, //                   <--- border color
      //       width: 5.0,
      //     )),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, top: 25, bottom: 25, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  color: Color(0xff8873EF)),
              child: Center(
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ClipOval(
                  //   child: SizedBox.fromSize(
                  //     child: Image.asset(
                  //         height: 50,
                  //         width: 50,
                  //         fit: BoxFit.cover,
                  //         'images/github.png'),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.89,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
