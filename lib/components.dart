// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/app_title.dart';
import 'package:live_exchange_rate_converter/components/currency_selection.dart';
import 'package:live_exchange_rate_converter/components/quick_selections.dart';
import 'package:live_exchange_rate_converter/components/swap_currency_button.dart';

///Class to access the individual components
class AppComponent {
  ///App Title widget component
  static AppTitle appTitle(String title){
    return AppTitle(title: title);
  }

  ///App Title widget component
  static QuickSelections quickSelections(String selectedCurrencyCode, void Function(int) quickSelectAmtFunc){
    return QuickSelections(selectedCurrencyCode: selectedCurrencyCode, quickSelectAmtFunc: quickSelectAmtFunc);
  }

  ///App Title widget component
  static SwapCurrencyButton swapCurrencyButton(void Function()? onPressed){
    return SwapCurrencyButton(onPressed: onPressed);
  }

  ///App Title widget component
  static CurrencySelection currencySelection(String selectedValue, void Function(String?) onSelectionChanged){
    return CurrencySelection(selectedValue: selectedValue, onSelectionChanged: onSelectionChanged);
  }

  

  static _AppGenerics generics = _AppGenerics();
}

class _AppGenerics {
  _AppGenerics();

  LinkButton linkButton(String buttonText, void Function() onPressed, {Color? backgroundColor, Color? hoverBackgroundColor, Color? borderColor, Color? hoverBorderColor, Color? fontColor, Color? hoverFontColor, void Function(bool)? onHover}) {
    return LinkButton(buttonText: buttonText, onPressed: onPressed, backgroundColor: backgroundColor, hoverBackgroundColor: hoverBackgroundColor, borderColor: borderColor, hoverBorderColor: hoverBorderColor, fontColor: fontColor, hoverFontColor: hoverFontColor, onHover: onHover);
  }

}



class LinkButton extends StatefulWidget {
  final String buttonText;
  final void Function() onPressed;
  final void Function(bool)? onHover;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? borderColor;
  final Color? hoverBorderColor;
  final Color? fontColor;
  final Color? hoverFontColor;

  const LinkButton({super.key, 
    required this.onPressed, 
    required this.buttonText, 
    this.backgroundColor, this.borderColor, this.fontColor, this.onHover, this.hoverBackgroundColor, this.hoverBorderColor, this.hoverFontColor});
  
  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState  extends State<LinkButton> {

  bool isHoverState = false;

  @override
  Widget build(BuildContext context) {

    hovering(isHovering){

      setState(() {
        isHoverState = isHovering;
      });

      if(widget.onHover != null){
        widget.onHover!(isHovering);
      }
    }
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          isHoverState 
          ? (widget.hoverBackgroundColor ?? const Color(0xff224ED0))
          : (widget.backgroundColor ?? const Color(0xff224ED0))
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: isHoverState 
              ? (widget.hoverBorderColor ?? const Color(0xffFDFBF6))
              : (widget.borderColor ?? const Color(0xffFDFBF6))
          )
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(25,20,25,20))
      ),
      onPressed: widget.onPressed, 
      onHover: hovering,
      child: RichText( 
        text: TextSpan(
          children: [
            TextSpan(text: widget.buttonText, style: TextStyle(
              color: isHoverState 
              ? (widget.hoverFontColor ?? const Color(0xffFDFBF6))
              : (widget.fontColor ?? const Color(0xffFDFBF6)), 
              fontSize: 18)
            ),
            WidgetSpan(child: Icon(Icons.open_in_new, 
              color: isHoverState 
                ? (widget.hoverFontColor ?? const Color(0xffFDFBF6))
                : (widget.fontColor ?? const Color(0xffFDFBF6)), 
              size: 18)
            )
          ]
        )
      )
    );
  }
}