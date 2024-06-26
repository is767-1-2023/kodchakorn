import 'package:flutter/material.dart';
import 'package:frist_app/pages/fifth_page.dart';
import 'package:frist_app/pages/fourth_page.dart';
import 'package:frist_app/pages/home_page.dart';
import 'package:frist_app/pages/sixth_page.dart';
import 'package:provider/provider.dart';
import 'pages/frist_page.dart';
import 'pages/second_page.dart';
import 'pages/thrid_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PreferenceModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Homepage(),
        '/1': (context) => FirstPage(),
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage(),
        '/4': (context) => FourthPage(),
        '/5': (context) => FifthPage(),
        '/6': (context) => SixthPage(),
      },
    );
  }
}
