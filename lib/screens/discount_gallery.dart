import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/widgets/my_app_bar.dart';

class DiscountGalleryScreen extends StatelessWidget {
  const DiscountGalleryScreen({
    super.key,
    this.fromOnBoarding = false,
  });

  final bool fromOnBoarding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromOnBoarding ? const MyAppBar(title: 'Discount') : null,
      body: const Center(
        child: Text('Discount Gallery Screen'),
      ),
    );
  }
}
