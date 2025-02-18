import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nomad_class_study04/screen/home_screen.dart';
import 'package:nomad_class_study04/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
