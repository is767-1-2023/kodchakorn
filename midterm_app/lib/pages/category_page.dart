import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ประเภทสินค้าที่ผลิต'),
      ),
      body: Center(child: Text('Blank Page')),
    );
  }
}
