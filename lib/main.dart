import 'package:flutter/material.dart';
import 'package:movil_ejercicio_flutter/screens/home_screen.dart';
import 'package:movil_ejercicio_flutter/screens/information_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio Flutter',
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
      ),
      routes: <String, WidgetBuilder>{
        InformationScreen.route: (context) => const InformationScreen(),
      },
    );
  }
}
