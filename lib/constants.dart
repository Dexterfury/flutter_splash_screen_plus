import 'package:flutter/material.dart';
import 'package:flutter_splash_screen_plus/screens/all_gellery.dart';
import 'package:flutter_splash_screen_plus/screens/auction_gallery.dart';
import 'package:flutter_splash_screen_plus/screens/discount_gallery.dart';
import 'package:flutter_splash_screen_plus/screens/men_gallery.dart';
import 'package:flutter_splash_screen_plus/screens/women_gallery.dart';

class Constants {
  // navigation routes
  static const String homeRoute = '/home';

  // onboarding routes
  static const String onboardingRoute = '/onboarding';

  // tabs
  static const tabs = <Tab>[
    Tab(
      child: Text('All'),
    ),
    Tab(
      child: Text('Men'),
    ),
    Tab(
      child: FittedBox(child: Text('Women')),
    ),
    Tab(
      child: FittedBox(child: Text('Auction')),
    ),
    Tab(
      child: FittedBox(child: Text('Discount')),
    ),
  ];

  // tab views
  static const tabViews = <Widget>[
    AllGalleryScreen(),
    MenGalleryScreen(),
    WomenGalleryScreen(),
    AuctionGalleryScreen(),
    DiscountGalleryScreen(),
  ];
}

enum OfferType {
  women,
  auction,
  discount,
}
