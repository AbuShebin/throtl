// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import '../theme/theme.dart';

// class CustomSearchField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final Function(String)? onChanged;

//   const CustomSearchField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           CupertinoIcons.search,
//           size: w * 0.05,
//           color: Colors.black54,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(w * 0.03),
//           borderSide: BorderSide(color: Palette.blackColor, width: w * 0.001),
//         ),
//         labelText: labelText,
//         labelStyle: TextStyle(
//           fontFamily: 'Urbanist',
//           fontSize: w * 0.04,
//           color: Palette.blackColor,
//         ),
//       ),
//       style: TextStyle(
//         fontFamily: 'Urbanist',
//         fontSize: w * 0.04,
//         color: Palette.blackColor,
//       ),
//       onChanged: onChanged,
//     );
//   }
// }
