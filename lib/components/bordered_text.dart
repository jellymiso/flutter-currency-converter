import 'package:flutter/material.dart';

class BorderedText extends StatefulWidget {

  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? strokeWidth;
  final Color? strokeColor;
  final Color? fontColor;

  const BorderedText({
    super.key, 
    required this.text, 
    this.fontSize, 
    this.textAlign,
    this.letterSpacing, 
    this.fontWeight, 
    this.strokeWidth, 
    this.strokeColor, 
    this.fontColor, this.fontFamily, 
  });


  @override
  State<BorderedText> createState() => _BorderedTextState();
}

class _BorderedTextState extends State<BorderedText> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          widget.text,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false, 
            leadingDistribution: TextLeadingDistribution.proportional
          ),
          textAlign: widget.textAlign ?? TextAlign.center,
          style: TextStyle(
            height: 1,
            fontSize: widget.fontSize ?? 50, 
            fontFamily: widget.fontFamily ?? "Montserrat",
            letterSpacing: widget.letterSpacing ?? 5, 
            fontWeight: widget.fontWeight ?? FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widget.strokeWidth ?? 5 //5
              ..color = widget.strokeColor ?? const Color(0xff1A2130),
          ),
        ),
        // Solid text as fill.
        Text(
          widget.text,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false, 
            leadingDistribution: TextLeadingDistribution.proportional
          ),
          textAlign: widget.textAlign ?? TextAlign.center,
          style: TextStyle(
            height: 1,
            fontSize: widget.fontSize ?? 50,
            fontFamily: widget.fontFamily ?? "Montserrat",
            letterSpacing: widget.letterSpacing ?? 5,
            fontWeight: widget.fontWeight ?? FontWeight.w900,
            color: widget.fontColor ?? const Color(0xff5A72A0),
          ),
        ),
      ],
    );
  }

}
