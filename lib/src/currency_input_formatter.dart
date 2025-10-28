import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final int decimalDigits;
  final String decimalSeparator;
  final String thousandSeparator;

  CurrencyInputFormatter({
    this.decimalDigits = 2,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Allow only digits
    final RegExp allowedChars = RegExp(r'[\d]');
    String cleanText = newValue.text
        .split('')
        .where((char) => allowedChars.hasMatch(char))
        .join('');

    // If no digits entered, return empty
    if (cleanText.isEmpty) {
      return const TextEditingValue();
    }

    // Pad with leading zeros to ensure we have enough digits for decimal part
    String paddedText = cleanText.padLeft(decimalDigits + 1, '0');

    // Split into integer and decimal parts
    String integerPart =
        paddedText.substring(0, paddedText.length - decimalDigits);
    String decimalPart =
        paddedText.substring(paddedText.length - decimalDigits);

    // Format integer part with thousand separators
    String formattedInteger = _formatIntegerPart(integerPart);

    // Build final formatted value
    String formattedValue = '$formattedInteger$decimalSeparator$decimalPart';

    // Calculate cursor position - always keep cursor at the end for right-to-left input
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  String _formatIntegerPart(String integerPart) {
    if (integerPart.isEmpty) return '0';

    // Remove any existing thousand separators
    String cleanInteger = integerPart.replaceAll(thousandSeparator, '');

    if (cleanInteger.isEmpty) return '0';

    // Parse to remove leading zeros
    int? integerValue = int.tryParse(cleanInteger);
    if (integerValue == null) return '0';

    String integerString = integerValue.toString();

    // Add thousand separators
    String reversed = integerString.split('').reversed.join('');
    List<String> chunks = [];

    for (int i = 0; i < reversed.length; i += 3) {
      int end = i + 3;
      if (end > reversed.length) end = reversed.length;
      chunks.add(reversed.substring(i, end));
    }

    return chunks.join(thousandSeparator).split('').reversed.join('');
  }

  double parse(String formattedValue) {
    if (formattedValue.isEmpty) return 0.0;

    try {
      // Remove thousand separators
      String cleanValue = formattedValue.replaceAll(thousandSeparator, '');

      // Handle decimal separator
      if (decimalSeparator != '.') {
        cleanValue = cleanValue.replaceAll(decimalSeparator, '.');
      }

      return double.tryParse(cleanValue) ?? 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  // Method to get the raw numeric value without formatting
  String getNumericValue(String formattedValue) {
    if (formattedValue.isEmpty) return '';

    // Remove all non-digit characters
    return formattedValue.replaceAll(RegExp(r'[^\d]'), '');
  }
}
