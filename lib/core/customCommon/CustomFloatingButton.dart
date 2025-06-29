// import 'package:flutter/material.dart';

// class CustomFloatingButton extends StatelessWidget {
//   final Function()? onPressed;
//   final String text;

//   const CustomFloatingButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: h * 0.06,
//         width: w * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(w * 0.04),
//           color: Palette.primaryColor,
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: w * 0.048,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//               fontFamily: 'Urbanist',
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
