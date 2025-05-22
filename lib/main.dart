import 'package:flutter/material.dart';
import 'package:throtl/core/utils/themes/pallete.dart';
import 'package:throtl/core/utils/themes/theme.dart';
import 'package:throtl/dashboard/screens/dashboardScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
       home:  DashboardScreen(),
       debugShowCheckedModeBanner: false,
    );
  }
}
