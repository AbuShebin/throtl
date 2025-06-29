import 'package:flutter/material.dart';

import '../customCommon/customDialogeBox.dart';

class ErrorText extends StatelessWidget {
  final String errorText;
  const ErrorText({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
