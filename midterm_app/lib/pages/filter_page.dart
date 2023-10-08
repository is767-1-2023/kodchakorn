import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('คัดกรองโรงงาน'),
      ),
      body: Center(child: Text('Blank Page')),
    );
  }
}
