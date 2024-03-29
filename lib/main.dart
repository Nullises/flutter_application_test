import "package:flutter/material.dart";
import "package:flutter_application_test/screens/bmi.dart";
import "package:flutter_application_test/screens/home.dart";

void main() {
  runApp(const GloboApp());
}

class GloboApp extends StatelessWidget {
  const GloboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => const Home(),
        '/bmi': (context) => const Bmi()
      },
      initialRoute: '/',
    );
  }
}
