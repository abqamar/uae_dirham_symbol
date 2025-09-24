import 'package:flutter_test/flutter_test.dart';
import 'package:uae_dirham_symbol/src/uae_dirham_symbol.dart';
import 'package:uae_dirham_symbol/src/util.dart';

void main() {
  test('passing amount to dirham widget', () {
    UaeDirhamSymbolTextView(amount: 100000.55);
    print(Util.formatNumber(1000000.66));
  });
}
