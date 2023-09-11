import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final List<String> entries = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];
  final List<int> colorCodes = [600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Second Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/3');
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Container(
            height: 150.0,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text('Item ${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: entries.length,
      ),
    );
  }
}
