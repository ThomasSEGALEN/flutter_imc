import 'package:flutter/material.dart';
import 'package:flutter_imc/calculator.dart';
import 'package:flutter_imc/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IMC',
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/home': (context) => const CalculatorPage(title: 'Calculator'),
        '/results': (context) => const ResultPage(title: 'Results'),
      },
      home: const CalculatorPage(title: 'Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
