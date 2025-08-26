import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/responsive_widget.dart';

class SwapCurrencyButton extends StatefulWidget {
  final void Function()? onPressed;

  const SwapCurrencyButton({super.key, required this.onPressed});
  
  @override
  State<SwapCurrencyButton> createState() => _SwapCurrencyButtonState();
}

class _SwapCurrencyButtonState extends State<SwapCurrencyButton> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)) ? const EdgeInsets.fromLTRB(100,5,100,5) : EdgeInsets.zero,
      child: IconButton(
        onPressed: widget.onPressed, 
        icon: RotatedBox(
          quarterTurns: (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)) ? 1 : 0,
          child: const Icon( 
            Icons.sync_alt 
          ),
        ), 
        color: const Color(0xffDBB86B),
        iconSize: ResponsiveWidget.isMaxScreen(context)
          ? 50 
          : ResponsiveWidget.isLargeScreen(context)
            ? 50
            : ResponsiveWidget.isMediumScreen(context)
              ? 30
              : ResponsiveWidget.isMediumScreen(context)
                ? 40
                : 30
      ),
    );
  }

}