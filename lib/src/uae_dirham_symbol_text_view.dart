import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/src/util.dart';

class UaeDirhamSymbolTextView extends StatelessWidget {
  final double amount;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final bool includeDecimal;
  final bool isFormatted;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final int spacing;

  const UaeDirhamSymbolTextView(
      {super.key,
      required this.amount,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.includeDecimal = true,
      this.isFormatted = true,
      this.decoration,
      this.decorationStyle,
      this.spacing = 0});

  @override
  Widget build(BuildContext context) {
    String spaces = ' ' * spacing;
    return Text(
      // Passing double value to function, Ex: 1000.50 that return formatted string with symbol
      '${Util.parseHtmlEntity("&#xea;")}$spaces${Util.formattedAmount(amount, includeDecimal: includeDecimal, isFormatted: isFormatted)}',
      style: TextStyle(
          fontFamily: 'Dirham',
          package: 'uae_dirham_symbol',
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color,
          decoration: decoration,
          decorationStyle: decorationStyle),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textDirection: TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
