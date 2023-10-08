import 'package:flutter/material.dart';

class QuotationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ใบขอเสนอราคา'),
      ),
      body: Center(child: Text('Blank Page')),
    );
  }
}
