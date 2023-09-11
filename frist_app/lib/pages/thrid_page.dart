import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final List<String> entries = [
    'images/cha1.jpg',
    'images/cha2.jpg',
    'images/cha3.jpg',
    'images/cha4.jpg',
    'images/cha5.jpg',
    'images/cha6.jpg',
    'images/cha7.jpg',
    'images/cha8.jpg',
    'images/cha9.jpg',
    'images/cha10.jpg',
  ];
  final List<int> colorCodes = [
    500,
    500,
    500,
    500,
    500,
    500,
    500,
    500,
    500,
    500
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Third Page'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Container(
            height: 250.0,
            color: Colors.blueGrey[colorCodes[index]],
            child: Center(
              child: Image.asset('${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: entries.length,
      ),
    );
  }
}
