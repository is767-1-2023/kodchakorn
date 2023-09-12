import 'package:flutter/material.dart';

class FifthPage extends StatefulWidget {
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  String _gender = '';
  String _favColor = '';
  String _pet = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var choice = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    choices: ['Male', 'Female', 'G', 'L', 'B', 'T', 'Q'],
                  ),
                ),
              );
              setState(() {
                _gender = choice;
              });
            },
            child: Text('Slect your gender - $_gender'),
          ),
          ElevatedButton(
            onPressed: () async {
              var choice = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    choices: [
                      'Yellow',
                      'Black',
                      'White',
                      'Blue',
                      'Purple',
                      'Tan',
                      'Sky'
                    ],
                  ),
                ),
              );
              setState(() {
                _favColor = choice;
              });
            },
            child: Text('Slect your favorite color - $_favColor'),
          ),
          ElevatedButton(
            onPressed: () async {
              var choice = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    choices: [
                      'Dog',
                      'Cat',
                      'Bird',
                      'Snake',
                      'Fish',
                      'Duck',
                      'Monkey'
                    ],
                  ),
                ),
              );
              setState(() {
                _pet = choice;
              });
            },
            child: Text('Slect your pet - $_pet'),
          ),
        ],
      ),
    );
  }
}

class PreferencePage extends StatelessWidget {
  final List<String> choices;
  const PreferencePage({super.key, required this.choices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your preference'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pop(context, choices[index]);
              },
              child: Text('${choices[index]}'),
            );
          },
        ),
      ),
    );
  }
}
