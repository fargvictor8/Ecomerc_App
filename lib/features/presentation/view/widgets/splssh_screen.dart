import 'package:flutter/material.dart';

import '../../../../onboarding.dart';

class SplsshScreen extends StatefulWidget {
  const SplsshScreen({super.key});

  @override
  State<SplsshScreen> createState() => _SplsshScreenState();
}

class _SplsshScreenState extends State<SplsshScreen> {

  @override
  void initState(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context,
          MaterialPageRoute(builder: (c) => OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Container(
       width: double.infinity,
       height: double.infinity,
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset("assets/Logo/logoipsum.png"),
         ],
       ),
     ),
    );
  }
}
