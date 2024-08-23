import 'package:flutter/material.dart';
import 'package:my_quiz/appbrain.dart';
import 'package:my_quiz/exam.dart';


void main() {
  runApp(const Quize_App());
}

// ignore: camel_case_types
class Quize_App extends StatelessWidget {
  const Quize_App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Exame_App(),
    );
  }
}

