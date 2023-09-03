import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/first',
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  double _counter4 = 1;

  void _incrementCounter() {
    setState(() {
      _counter1++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter1--;
    });
  }

  void _incrementCounterByTwo() {
    setState(() {
      _counter2 += 2;
    });
  }

  void _decrementCounterByTwo() {
    setState(() {
      _counter2 -= 2;
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counter4 *= 2;
    });
  }

  void _divideCounter() {
    setState(() {
      _counter4 /= 2;
    });
  }

  void _decrementCounter2() {
    setState(() {
      _counter3 -= 2;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter3 += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Triple Row_Kodchakorn'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/cha.jpg'),
              ),
              SizedBox(
                width: 200.0,
                child:
                    Image.network('https://greats.tu.ac.th/static/tu_logo.png'),
              ),
              const Text(
                'You have pushed the buttom this many times:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$_counter1',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('++'),
                  ),
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Text('--'),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  '$_counter2',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: _incrementCounterByTwo,
                  child: const Text('+++'),
                ),
                ElevatedButton(
                    onPressed: _decrementCounterByTwo, child: const Text('---'))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  '$_counter3',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: _decrementCounter2,
                  child: const Text('---'),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter2,
                  child: const Text('+++'),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  '$_counter4',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: _multiplyCounter,
                  child: const Text('***'),
                ),
                ElevatedButton(
                  onPressed: _divideCounter,
                  child: const Text('///'),
                )
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('First Page'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Hello....'),
                ),
              );
            },
            icon: Icon(Icons.add_alert),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: Text('Blank page'),
      ),
    );
  }
}

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
              Navigator.pushNamed(context, '/third');
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
