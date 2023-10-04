import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent(this.text, this.iconType);
  final String? text;
  final IconData iconType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$text",
          style: TextStyle(fontSize: 18, color: Color(0xff8D8E98)),
        ),
      ],
    );
  }
}
