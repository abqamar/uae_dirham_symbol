import 'package:flutter/material.dart';
import 'package:uae_dirham_symbol/uae_dirham_symbol.dart';

class ProductListScreen extends StatelessWidget {
  final VoidCallback onToggleLanguage;
  final bool isArabic;

  const ProductListScreen({
    super.key,
    required this.onToggleLanguage,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name_en': 'Leather Bag',
        'name_ar': 'حقيبة جلدية',
        'price': 250.0,
        'emoji': '👜',
      },
      {
        'name_en': 'Wrist Watch',
        'name_ar': 'ساعة يد',
        'price': 580.0,
        'emoji': '⌚',
      },
      {
        'name_en': 'Sunglasses',
        'name_ar': 'نظارات شمسية',
        'price': 300.0,
        'emoji': '🕶️',
      },
      {'name_en': 'Shoes', 'name_ar': 'حذاء', 'price': 450.0, 'emoji': '👟'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'المنتجات' : 'Products')),
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];

              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product['emoji'] as String,
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isArabic
                          ? product['name_ar']! as String
                          : product['name_en']! as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomDirhamSymbolTextView(
                      amount: product['price'] as double,
                      amountStyle: TextStyle(fontSize: 16),
                      //symbolColor: Colors.green,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
