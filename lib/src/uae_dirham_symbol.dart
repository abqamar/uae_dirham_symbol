import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/src/util.dart';
//import 'package:intl/intl.dart' as intl;

class UaeDirhamSymbolTextView extends StatelessWidget {

  final double amount;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const UaeDirhamSymbolTextView({super.key,
    required this.amount,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(Util.formatNumber(amount),
      style: TextStyle(
        fontFamily: 'Dirham',
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textDirection: TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
