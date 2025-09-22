import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

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
    return Text(getFormattedPrice(amount),
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

  String getFormattedPrice(dynamic number){

    if(number is String){
      throw 'invalid number';
    }

    final currencyFormatter = intl.NumberFormat.currency(
      locale: 'en_US',
      symbol: 'ê ',
      decimalDigits: 2,
    );
    String formattedPrice = currencyFormatter.format(number);
    return formattedPrice;
  }
}
