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
      home: const MyHomePage(title: 'Flutter Demo '),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
