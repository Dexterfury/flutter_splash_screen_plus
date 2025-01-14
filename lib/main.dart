import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/constants.dart';
import 'package:flutter_splash_screen_plus/screens/home_screen.dart';
import 'package:flutter_splash_screen_plus/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Constants.onboardingRoute,
      routes: {
        Constants.onboardingRoute: (context) => const OnBoardingScreen(),
        Constants.homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}
