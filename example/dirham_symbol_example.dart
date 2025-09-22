import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/src/uae_dirham_symbol.dart';

class DirhamSymbolExample extends StatelessWidget {
  const DirhamSymbolExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UAE Dirham Symbol TextView"),
        centerTitle: true,
      ),
      body: Center(
        child: UaeDirhamSymbolTextView(amount: 1.99),
      ),
    );
  }
}
