import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/bordered_text.dart';
import 'package:live_exchange_rate_converter/components/responsive_widget.dart';

class AppTitle extends StatefulWidget {

  final String title;
  const AppTitle({super.key, required this.title});
  

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {

  @override
  Widget build(BuildContext context) {
    return BorderedText(
      text: widget.title, 
      textAlign: TextAlign.center,
      fontSize: ResponsiveWidget.isMaxScreen(context) 
        ? 60 
        : ResponsiveWidget.isLargeScreen(context)
          ? 60
          : ResponsiveWidget.isMediumScreen(context)
          ? 45
          : ResponsiveWidget.isSmallScreen(context)
            ? 50
            : 36, 
      letterSpacing: 2, 
      fontWeight: FontWeight.w500, 
      strokeWidth: 3, 
      strokeColor: const Color(0xff010017), 
      fontColor: const Color(0xffDBB86B)
    );
  }

}
