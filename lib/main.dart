import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:throtl/core/utils/routes/routing.dart';
import 'package:throtl/core/utils/themes/theme.dart';

void main() {
  
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Routing().router;
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: appTheme,
       debugShowCheckedModeBanner: false,
    );
  }
}
