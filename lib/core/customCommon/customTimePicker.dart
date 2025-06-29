
import 'package:flutter/material.dart';

Future<String?> pickTimeCustom({required BuildContext context}) async {
  final pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    // print("picked time${pickedTime.toString() }");
    String time = "${pickedTime.hour}:${pickedTime.minute}";
    return time;
  }
  return null;
}
