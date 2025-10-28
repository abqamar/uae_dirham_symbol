class Util {
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
      String limitedDecimals =
          decimalPart.length > 2 ? decimalPart.substring(0, 2) : decimalPart;
      result += '.$limitedDecimals';
    }

    return result;
  }

  static String formatAmount(double number, {bool includeDecimals = true}) {
    // Handle negative numbers
    bool isNegative = number < 0;
    number = number.abs();

    // Split integer and decimal parts (rounded to 2 decimals)
    String numberStr = number.toStringAsFixed(2);
    List<String> parts = numberStr.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '00';

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

    if (includeDecimals) {
      result += '.$decimalPart';
    }

    return result;
  }

  static String parseHtmlEntity(String entity) {
    if (entity.startsWith('&#') && entity.endsWith(';')) {
      String code = entity.substring(2, entity.length - 1);
      if (code.startsWith('x')) {
        // Hexadecimal &#xE800;
        int decimalValue = int.parse(code.substring(1), radix: 16);
        return String.fromCharCode(decimalValue);
      } else {
        // Decimal &#59392;
        int decimalValue = int.parse(code);
        return String.fromCharCode(decimalValue);
      }
    }
    return entity;
  }
}
