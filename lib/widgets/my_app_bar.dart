import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          // navigate to home screen
          Navigator.pushReplacementNamed(context, Constants.homeRoute);
        },
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
