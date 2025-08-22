import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? fontSize;
  final double? wordSpacing;
  final double? letterSpacing;
  final Color? textColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final double? height;
  final Function()? onTap;
  const AppText({
    super.key,
    required this.text,
    this.textStyle,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.wordSpacing,
    this.letterSpacing,
    this.height, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style:
            textStyle ??
            Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: fontSize,
              color: textColor,
              backgroundColor: backgroundColor,
              fontWeight: fontWeight,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height,
            ),
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
      ),
    );
  }
}
