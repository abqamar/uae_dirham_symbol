class CurrencyFormatter {
  final String symbol;
  final int decimalDigits;
  final String decimalSeparator;
  final String thousandSeparator;
  final bool symbolOnLeft;
  final bool spaceBetweenAmountAndSymbol;

  CurrencyFormatter({
    required this.symbol,
    this.decimalDigits = 2,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.symbolOnLeft = true,
    this.spaceBetweenAmountAndSymbol = true,
  });

  String format(String value) {
    if (value.isEmpty) return '';

    // Remove all non-digit characters except decimal separator
    String cleanValue = value.replaceAll(RegExp(r'[^\d$decimalSeparator]'), '');

    // Handle decimal part
    List<String> parts = cleanValue.split(decimalSeparator);
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Limit decimal digits
    if (decimalPart.length > decimalDigits) {
      decimalPart = decimalPart.substring(0, decimalDigits);
    }

    // Format integer part with thousand separators
    String formattedInteger = _formatIntegerPart(integerPart);

    // Build the final formatted string
    String formattedValue = decimalPart.isNotEmpty
        ? '$formattedInteger$decimalSeparator$decimalPart'
        : formattedInteger;

    // Add currency symbol
    String symbolPrefix = symbolOnLeft ? symbol : '';
    String symbolSuffix = symbolOnLeft ? '' : symbol;
    String space = spaceBetweenAmountAndSymbol ? ' ' : '';

    return '${symbolOnLeft ? '$symbolPrefix$space' : ''}$formattedValue${!symbolOnLeft ? '$space$symbolSuffix' : ''}';
  }

  String _formatIntegerPart(String integerPart) {
    if (integerPart.isEmpty) return '0';

    String reversed = integerPart.split('').reversed.join('');
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

    // Remove currency symbol and spaces
    String cleanValue = formattedValue.replaceAll(symbol, '');
    if (spaceBetweenAmountAndSymbol) {
      cleanValue = cleanValue.replaceAll(' ', '');
    }

    // Remove thousand separators
    cleanValue = cleanValue.replaceAll(thousandSeparator, '');

    // Handle decimal separator
    if (decimalSeparator != '.') {
      cleanValue = cleanValue.replaceAll(decimalSeparator, '.');
    }

    return double.tryParse(cleanValue) ?? 0.0;
  }

  String getMask() {
    String integerMask = '#${thousandSeparator}###';
    String decimalMask =
        decimalDigits > 0 ? '$decimalSeparator${'#' * decimalDigits}' : '';
    return '$integerMask$decimalMask';
  }
}
