import 'package:flutter/material.dart';
import 'package:idna_food/screens/assign_screen/assign_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idna Food',
      home: AssignScreen(),
    );
  }
}
