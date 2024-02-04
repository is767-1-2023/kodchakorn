import 'package:flutter/material.dart';

class Sweaterpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('เสื้อกันหนาว'),
      ),
      body: Center(child: Text('Blank Page')),
    );
  }
}
