import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/core/Routing/routes.dart';
import 'package:untitled/core/extensions/navigation_extensions.dart';

import '../../../../onboarding.dart';

class SplsshScreen extends StatefulWidget {
  const SplsshScreen({super.key});

  @override
  State<SplsshScreen> createState() => _SplsshScreenState();
}

class _SplsshScreenState extends State<SplsshScreen> with SingleTickerProviderStateMixin{

  double opacity = 0.0;

  @override
  void initState(){
    Timer(Duration(milliseconds: 1000),(){
    setState(() {
      opacity = 1.0;
    });
    });
    Timer(Duration(seconds: 5),(){
      context.pushNamed(Routes.OnboardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Center(
       child: AnimatedOpacity(
         opacity: opacity,
         duration: Duration(seconds: 4),
         child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 50),
           child:  Image.asset("assets/Logo/logoipsum.png"),
         ),
       ),
     )
    );
  }
}
