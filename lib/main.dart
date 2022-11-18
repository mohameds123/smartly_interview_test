import 'package:flutter/material.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/utils/app_strings.dart';
import 'package:movies/layout.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData(),
      home: const AppLayout(),
    );
  }
}



