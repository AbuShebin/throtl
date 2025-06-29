import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String divText;

  const CustomDivider({super.key, required this.divText});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            color: Colors.grey,
            height: h * 0.001,
          ),
        ),
        Text(
          divText,
          style: TextStyle(
            fontSize: w * 0.03,
            color: Colors.black,
            fontFamily: 'Urbanist',
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey,
            height: h * 0.001,
          ),
        ),
      ],
    );
  }
}
