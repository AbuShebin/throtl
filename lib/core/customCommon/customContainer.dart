// import 'package:crm_gramboo/core/theme/theme.dart';
// import 'package:flutter/material.dart';

// class CustomClickableContainer extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;

//   const CustomClickableContainer({
//     super.key,
//     required this.onTap,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: h * 0.06,
//         width: w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           border: Border.all(
//             color: Colors.black,
//             width: w * 0.001,
//           ),
//         ),
//         child: Row(
//           children: [
//             Text(
//               text,
//               style: TextStyle(
//                 fontFamily: 'Urbanist',
//                 fontSize: h * 0.018,
//                 color: Palette.blackColor,
//               ),
//             ),
//             const Spacer(),
//             Icon(
//               Icons.arrow_right,
//               size: w * 0.06,
//               color: Colors.grey.shade700,
//             ),
//             SizedBox(width: w * 0.045)
//           ],
//         ),
//       ),
//     );
//   }
// }
