import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/src/util.dart';

class UaeDirhamSymbolTextView extends StatelessWidget {
  final double amount;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const UaeDirhamSymbolTextView({
    super.key,
    required this.amount,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      // Passing double value to function, Ex: 1000.50 that return formatted string with symbol
      Util.formatNumber(amount),
      style: TextStyle(
        fontFamily: 'Dirham', // Supported font that display dirham font
        package: 'uae_dirham_symbol',
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textDirection: TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
