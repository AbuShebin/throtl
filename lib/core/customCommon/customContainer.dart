import 'package:flutter/material.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class CustomClickableContainer extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String text;
  final Color textColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Icon? icon;

  const CustomClickableContainer({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
    required this.textColor,
     this.height,
     this.width,
     this.borderColor,
     this.icon
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
        final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? h * 0.06,
        width: width ?? w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(w * 0.03),
          border: Border.all(
            color:borderColor?? Colors.grey,
            width: w * 0.001,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: h * 0.018,
                color: textColor,
              ),
            ),
            icon ?? SizedBox(),
            SizedBox(width: w * 0.045)
          ],
        ),
      ),
    );
  }
}
