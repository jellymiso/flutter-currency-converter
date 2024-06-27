import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/bordered_text.dart';

import 'responsive_widget.dart';

class ThemedTextBox extends StatefulWidget {

  final String labelText;
  final Color? labelTextColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? borderBottomColor;
  final Widget? prefix;
  final Widget? suffix;
  final bool isReadOnly;
  final TextInputType? textboxInputType;
  final TextAlign? textAlign;
  final TextEditingController? textController;
  final void Function(String)? onTextUpdate;

  const ThemedTextBox({
    super.key, 
    required this.labelText, 
    this.labelTextColor, 
    this.backgroundColor, 
    this.borderColor, 
    this.borderBottomColor, 
    this.isReadOnly = false, this.suffix, this.prefix, this.textboxInputType, this.textAlign, this.textController, required this.onTextUpdate
  });


  @override
  State<ThemedTextBox> createState() => _ThemedTextBoxState();
}

class _ThemedTextBoxState extends State<ThemedTextBox> {

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Wrap(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? const Color(0xff010059).withOpacity(0.95),
            border: Border.all(color: widget.borderColor ?? const Color(0xffDBB86B), width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: widget.borderBottomColor ?? Colors.transparent,
                blurRadius: 0,
                offset: const Offset(0, 1),
              ),
            ]
          ),
          margin: ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.fromLTRB(50,0,50,0)
            : null,
          padding: ResponsiveWidget.isMaxScreen(context)
            ? const EdgeInsets.fromLTRB(10, 5, 5, 5)
            : ResponsiveWidget.isLargeScreen(context) 
              ? const EdgeInsets.fromLTRB(10, 5, 5, 5)
              : const EdgeInsets.fromLTRB(7, 1, 1, 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.005),
              BorderedText(
                text: widget.labelText.toUpperCase(), 
                textAlign: TextAlign.left,
                fontSize: ResponsiveWidget.isMaxScreen(context) 
                  ? 10
                  : ResponsiveWidget.isLargeScreen(context)
                    ? 10
                    : 8, 
                letterSpacing: 2, 
                fontWeight: FontWeight.w900, 
                strokeWidth: 2, 
                strokeColor: const Color(0xff1A2130), 
                fontColor:  widget.labelTextColor ?? const Color(0xffFDFBF6),
              ),
              SizedBox(height: screenSize.height * 0.005),
              TextField(
                onChanged: widget.onTextUpdate ?? (value){},
                controller: widget.textController,
                inputFormatters: widget.textboxInputType == null 
                  ? [] 
                  : widget.textboxInputType == TextInputType.number 
                    ? [
                        CurrencyTextInputFormatter.currency( symbol: "" )
                      ]
                    : [],
                keyboardType: widget.textboxInputType ?? TextInputType.text,
                readOnly: widget.isReadOnly,
                maxLines: 1,
                textAlign: widget.textAlign ?? TextAlign.left,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  constraints: BoxConstraints( 
                    maxWidth: ResponsiveWidget.isMaxScreen(context) 
                      ? 300
                      : ResponsiveWidget.isLargeScreen(context) 
                        ? 300
                        : ResponsiveWidget.isMediumScreen(context) 
                          ? 250
                          : ResponsiveWidget.isSmallScreen(context) 
                            ? 350
                            : 250
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(0,5,0,5),
                  border: InputBorder.none,
                  prefixIcon: widget.prefix,
                  prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  suffix: widget.suffix
                ),
                style: const TextStyle(color: Color(0xffFDFBF6), shadows: [
                  Shadow(color: Color(0xff010017),offset: Offset(1,1), blurRadius: 3)
                ]),
                
              ),
              SizedBox(height: screenSize.height * 0.0025),

            ],
          ),
        )
      ],
    );
  }

}