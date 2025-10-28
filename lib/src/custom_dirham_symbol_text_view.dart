import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/src/util.dart';

class CustomDirhamSymbolTextView extends StatelessWidget {
  final double amount;
  final double? symbolFontSize;
  final FontWeight? symbolFontWeight;
  final Color? symbolColor;
  final TextAlign? textAlign;
  final bool? includeDecimal;
  final TextStyle? amountStyle;
  final int spacing;

  const CustomDirhamSymbolTextView({
    super.key,
    required this.amount,
    this.symbolFontSize,
    this.symbolFontWeight,
    this.symbolColor,
    this.textAlign,
    this.includeDecimal,
    this.amountStyle,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    String spaces = ' ' * spacing;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Util.parseHtmlEntity("&#xea;"),
          style: TextStyle(
            fontFamily: 'Dirham',
            package: 'uae_dirham_symbol',
            fontSize: symbolFontSize,
            fontWeight: symbolFontWeight ?? FontWeight.normal,
            color: symbolColor,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        Text(spaces),
        Text(
          Util.formatAmount(amount, includeDecimals: includeDecimal ?? true),
          style: amountStyle,
        ),
      ],
    );
  }
}
