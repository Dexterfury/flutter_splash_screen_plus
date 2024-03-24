import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('E-Commerce App'),
          elevation: 0,
          bottom: const TabBar(tabs: Constants.tabs),
        ),
        body: const TabBarView(
          children: Constants.tabViews,
        ),
      ),
    );
  }
}
