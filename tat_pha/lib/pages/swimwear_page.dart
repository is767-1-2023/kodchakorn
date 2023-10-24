import 'package:flutter/material.dart';

class SwimwearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ชุดว่ายน้ำ'),
      ),
      body: Center(child: Text('Blank Page')),
    );
  }
}
