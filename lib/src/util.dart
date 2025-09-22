class Util{
  static String formatNumber(double number, {bool includeDecimals = true}) {
    // Handle negative numbers
    bool isNegative = number < 0;
    number = number.abs();

    // Split integer and decimal parts
    String numberStr = number.toString();
    List<String> parts = numberStr.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Format integer part with commas
    String formattedInteger = '';
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) {
        formattedInteger = ',' + formattedInteger;
      }
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
    }

    // Combine parts
    String result = isNegative ? '-$formattedInteger' : formattedInteger;

    if (includeDecimals && decimalPart.isNotEmpty) {
      // Limit decimals to 2 places
      String limitedDecimals = decimalPart.length > 2
          ? decimalPart.substring(0, 2)
          : decimalPart;
      result += '.$limitedDecimals';
    }

    return "ê $result";
  }
}