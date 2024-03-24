import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/widgets/my_app_bar.dart';

class AuctionGalleryScreen extends StatelessWidget {
  const AuctionGalleryScreen({
    super.key,
    this.fromOnBoarding = false,
  });

  final bool fromOnBoarding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromOnBoarding ? const MyAppBar(title: 'Auction') : null,
      body: const Center(
        child: Text('Auction Gallery Screen'),
      ),
    );
  }
}
