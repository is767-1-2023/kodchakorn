import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FifthPage extends StatefulWidget {
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    type: 'gender',
                    choices: ['Male', 'Female', 'G', 'L', 'B', 'T', 'Q'],
                  ),
                ),
              );
            },
            child: Consumer<PreferenceModel>(
              builder: (context, value, child) {
                return Text('Slect your gender - ${value.gender}');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    type: 'favColor',
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
            },
            child: Consumer<PreferenceModel>(
              builder: (context, value, child) {
                return Text('Slect your favColor - ${value.favColor}');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    type: 'pet',
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
            },
            child: Consumer<PreferenceModel>(
              builder: (context, value, child) {
                return Text('Slect your pet - ${value.pet}');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PreferencePage extends StatelessWidget {
  final List<String> choices;
  final String type;

  const PreferencePage({super.key, required this.type, required this.choices});

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
                if (type == 'gender') {
                  context.read<PreferenceModel>()._gender = choices[index];
                }

                if (type == 'favColor') {
                  context.read<PreferenceModel>()._favColor = choices[index];
                }

                if (type == 'pet') {
                  context.read<PreferenceModel>()._pet = choices[index];
                }

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

class PreferenceModel extends ChangeNotifier {
  String _gender = '';
  String _favColor = '';
  String _pet = '';

  get gender => this._gender;
  set gender(value) {
    this.gender = value;
    notifyListeners();
  }

  get favColor => this._favColor;
  set favColor(value) {
    this.favColor = value;
    notifyListeners();
  }

  get pet => this._pet;
  set pet(value) {
    this.pet = value;
    notifyListeners();
  }
}
