import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget maxScreen;
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? tinyScreen;

  const ResponsiveWidget({
    super.key,
    required this.maxScreen,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.tinyScreen,
  });

  static bool isMaxScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1680;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1280 &&
        MediaQuery.of(context).size.width <= 1680 ;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768 &&
        MediaQuery.of(context).size.width <= 1280;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 432 &&
        MediaQuery.of(context).size.width <= 768;
  }
  
  static bool isTinyScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <= 432;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1680) {
          return maxScreen;
        } else if (constraints.maxWidth <= 1680 && constraints.maxWidth > 1280) {
          return largeScreen ?? maxScreen;
        } else if (constraints.maxWidth <= 1280 && constraints.maxWidth > 768) {
          return mediumScreen ?? maxScreen;
        } else if (constraints.maxWidth <= 768 && constraints.maxWidth > 432) {
          return smallScreen ?? maxScreen;
        } else {
          return tinyScreen ?? maxScreen;
        }
      },
    );
  }
}