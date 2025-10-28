Use UAE Dirham Symbol as Text in your application. Avoid adding dirham font and manage the code. Just Use UaeDirhamSymbolTextView and pass decimal number to the parameter "amount" and you will get the amount formatted with dirham symbol.
No SVG pure Text Widget. Use CustomDirhamSymbolTextView to customize both symbol and amount text separately.

[![pub package](https://img.shields.io/pub/v/uae_dirham_symbol.svg)](https://pub.dev/packages/uae_dirham_symbol)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Features

Use UAE Dirham symbol with custom styling.

## Getting started

Only add [uae_dirham_symbol](https://pub.dev/packages/uae_dirham_symbol) package to your pubspec.yaml.

```yaml
dependencies:
  uae_dirham_symbol: ^0.0.4
```

## Usage

```dart
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
```

## Parameters (UaeDirhamSymbol)

| Type        | Name       | Description                                     |  
|-------------|------------|-------------------------------------------------| 
| double?     | fontSize   | Default                                         |  
| FontWeight? | fontWeight | FontWeight.normal (Default)                     |  
| Color?      | color      | no color (uses theme color)                     |  
| TextAlign?  | textAlign  | TextAlign.start (Default)                       |

## Parameters (UaeDirhamSymbolTextView)

| Type                 | Name            | Description                                     |  
|----------------------|-----------------|-------------------------------------------------|
| double               | amount          | any number (Ex: 10.0)                           |  
| double?              | fontSize        | Default                                         |  
| FontWeight?          | fontWeight      | FontWeight.normal (Default)                     |  
| Color?               | color           | no color (uses theme color)                     |  
| TextAlign?           | textAlign       | TextAlign.start (Default)                       |
| int?                 | spacing         | Default = 0 - Spacing between amount and symbol |
| TextDecoration?      | decoration      | apply decoration on amount                      |
| TextDecorationStyle? | decorationStyle | apply decoration style on amount                |

## Parameters (CustomDirhamSymbolTextView)

| Type        | Name             | Description                                     |  
|-------------|------------------|-------------------------------------------------|
| double      | amount           | any number (Ex: 10.0)                           |  
| Color?      | symbolColor      | no color (uses theme color)                     |  
| double?     | symbolFontSize   | Symbol font size                                |  
| FontWeight? | symbolFontWeight | FontWeight.normal (Default)                     |
| TextAlign?  | textAlign        | TextAlign.start (Default)                       |
| int?        | spacing          | Default = 0 - Spacing between amount and symbol |
| bool?       | includeDecimal   | default = true                                  |
| TextStyle?  | amountStyle      | Use TextStyle for amount                        |

<table>
<td>
<img src="https://raw.githubusercontent.com/abqamar/uae_dirham_symbol/refs/heads/main/screenshots/preview.png", alt="", height="1067px", width="480px"/>
</td>
</table>

## Support

For support or questions, please open an issue in the GitHub repository or contact the development team.