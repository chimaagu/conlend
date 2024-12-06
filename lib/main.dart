import 'package:colend/route.dart';
import 'package:flutter/material.dart';

import 'onboarding_page/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    navigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0467DE),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 250,
        ),
      ),
    );
  }

  void navigate() {
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () async {
      nextPage(context, page: const OnboardingScreen());
    });
  }
}
