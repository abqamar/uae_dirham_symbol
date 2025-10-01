Use UAE Dirham Symbol as Text in your application. Avoid adding dirham font and manage the code. Just Use UaeDirhamSymbolTextView and pass decimal number to the parameter "amount" and you will get the amount formatted with dirham symbol.

## Features

Use UAE Dirham symbol with custom limited styling.

## Getting started

[![pub package](https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi)](https://pub.dev/packages/uae_dirham_symbol)

Only add [uae_dirham_symbol](https://pub.dev/packages/uae_dirham_symbol) package to your pubspec.yaml.

```yaml
dependencies:
  uae_dirham_symbol: ^0.0.3
```

## Usage

Use UaeDirhamSymbolTextView to display amount/prices with Dirham symbol.

```dart
class DirhamSymbolExample extends StatelessWidget {
  const DirhamSymbolExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UAE Dirham Symbol Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UAE Dirham Symbol TextView"),
            UaeDirhamSymbolTextView(amount: 10000.99),
            const SizedBox(height: 10,),
            Text("UAE Dirham Symbol Only"),
            UaeDirhamSymbol(fontSize: 30,),
          ],
        ),
      ),
    );
  }
}
```

## Parameters

| Type        | Name       | Value                       |  
|-------------|------------|-----------------------------|
| double      | amount     | any number (Ex: 10.0)       |  
| double?     | fontSize   | Default                     |  
| FontWeight? | fontWeight | FontWeight.normal (Default) |  
| Color?      | color      | no color (uses theme color) |  
| TextAlign?  | textAlign  | TextAlign.start (Default)   |

<table>
<td>
<img src="https://raw.githubusercontent.com/abqamar/uae_dirham_symbol/refs/heads/main/screenshots/preview.png", alt="", height="800px", width="480px"/>
</td>
</table>

## Support

For support or questions, please open an issue in the GitHub repository or contact the development team.