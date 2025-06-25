// lib/main.dart
import 'package:flutter/material.dart';
import 'package:untitled/features/presentation/view/widgets/splssh_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplsshScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
