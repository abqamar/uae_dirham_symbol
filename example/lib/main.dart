import 'package:example/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/uae_dirham_symbol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Demo',
      debugShowCheckedModeBanner: false,
      home: DirhamSymbolExample(),
    );
  }
}

class DirhamSymbolExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "UAE Dirham Symbol Example",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "UAE Dirham Symbol TextView with amount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    const UaeDirhamSymbolTextView(
                      amount: 10000.99,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      includeDecimal: false,
                      decoration: TextDecoration.lineThrough,
                    ),
                    const UaeDirhamSymbolTextView(
                      amount: 10000.99,
                      fontSize: 20,
                      color: Colors.red,
                      spacing: 1,
                    ),
                    const UaeDirhamSymbolTextView(
                      amount: 10000.99,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const UaeDirhamSymbolTextView(
                      amount: 10000.99,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),

            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Symbol and amount separate styling",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    const CustomDirhamSymbolTextView(
                      amount: 11111.9,
                      spacing: 1,
                    ),
                    const CustomDirhamSymbolTextView(
                      amount: 11111.99,
                      symbolFontSize: 18,
                      symbolFontWeight: FontWeight.bold,
                      symbolColor: Colors.green,
                      amountStyle: TextStyle(fontSize: 20),
                    ),
                    const CustomDirhamSymbolTextView(
                      amount: 11111.9,
                      symbolFontSize: 30,
                      amountStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const CustomDirhamSymbolTextView(
                      amount: 1111.99,
                      includeDecimal: false,
                      symbolFontSize: 10,
                      symbolFontWeight: FontWeight.bold,
                      amountStyle: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Symbol with different sizes and color",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        UaeDirhamSymbol(fontSize: 20, color: Colors.green),
                        UaeDirhamSymbol(fontSize: 30, color: Colors.red),
                        UaeDirhamSymbol(fontSize: 40, color: Colors.amber),
                        UaeDirhamSymbol(fontSize: 50, color: Colors.blue),
                        UaeDirhamSymbol(fontSize: 60),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
