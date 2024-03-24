import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_splash_screen_plus/constants.dart';
import 'package:flutter_splash_screen_plus/screens/auction_gallery.dart';
import 'package:flutter_splash_screen_plus/screens/discount_gallery.dart';
import 'package:flutter_splash_screen_plus/screens/home_screen.dart';
import 'package:flutter_splash_screen_plus/screens/women_gallery.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  // timer
  Timer? _countdownTimer;
  // seconds
  int _seconds = 5;

  // selected index
  late int _selectedIndex;
  // offer name
  late String _offerName;
  // asset name
  late String _assetName;
  // offer
  late OfferType _offerType;
  // animation controller
  late AnimationController _animationController;
  // color tween
  late Animation<Color?> _colorTweenAnimation;

  @override
  void initState() {
    // 1. remove top and bottom bars
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // 2. select the random screen
    selectRandomScreen();

    // 3. start the timer
    startTimer();

    // 4. set the animation controller
    setAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    // 1. put back the top and bottom bars
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    // 2. cancel the timer
    _countdownTimer?.cancel();
    // 3. dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  // start timer
  void startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds == 0) {
        timer.cancel();
        // navigate to the home screen
        navigate();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  // select random screen
  void selectRandomScreen() {
    for (int i = 0; i < OfferType.values.length; i++) {
      var random = Random();
      setState(() {
        _selectedIndex = random.nextInt(OfferType.values.length);
        _offerType = OfferType.values[_selectedIndex];
        _offerName = _offerType.toString().split('.').last;
        _assetName = _offerName.toLowerCase();
      });
    }
  }

  // set animation controller and color tween
  void setAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _colorTweenAnimation = ColorTween(
      begin: Colors.orange,
      end: Colors.orange.shade900,
    ).animate(_animationController)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    _animationController.repeat();
  }

  // navigate
  void navigate({OfferType? offerType}) {
    if (offerType != null) {
      switch (offerType) {
        case OfferType.women:
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const WomenGalleryScreen(
                fromOnBoarding: true,
              ),
            ),
            (route) => false,
          );
          break;
        case OfferType.auction:
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AuctionGalleryScreen(
                fromOnBoarding: true,
              ),
            ),
            (route) => false,
          );
          break;
        case OfferType.discount:
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const DiscountGalleryScreen(
                fromOnBoarding: true,
              ),
            ),
            (route) => false,
          );
          break;
        default:
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  // build lottie animation
  Widget buildLottieAnimation() {
    return Center(
      child: Lottie.asset(
        'assets/lottie/$_assetName.json',
      ),
    );
  }

  // build skip button
  Widget buildSkipButton() {
    return Positioned(
        top: 60,
        right: 20,
        child: Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: MaterialButton(
            onPressed: () async {
              // cancel the timer
              _countdownTimer?.cancel();

              // navigate to the home screen
              navigate();
            },
            child: _seconds < 1
                ? const Text('SKIP')
                : Text(
                    'SKIP | $_seconds',
                  ),
          ),
        ));
  }

  Widget buildShopNowButton() {
    return Positioned(
        bottom: 60,
        left: 60,
        right: 60,
        child: AnimatedBuilder(
          animation: _colorTweenAnimation,
          builder: (context, child) {
            return Container(
              height: 50,
              decoration: BoxDecoration(
                color: _colorTweenAnimation.value,
                borderRadius: BorderRadius.circular(30),
              ),
              child: MaterialButton(
                onPressed: () async {
                  // cancel the timer
                  _countdownTimer?.cancel();

                  // navigate to the home screen
                  navigate(offerType: _offerType);
                },
                child: const Text('SHOP NOW'),
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          // center lottie animation
          buildLottieAnimation(),

          // skip button
          buildSkipButton(),

          // shop now button
          buildShopNowButton(),
        ],
      ),
    );
  }
}
