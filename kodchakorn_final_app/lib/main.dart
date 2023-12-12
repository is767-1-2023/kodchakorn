import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kodchakorn_final_app/firebase_options.dart';
import 'package:kodchakorn_final_app/models/booking_model.dart';
import 'package:kodchakorn_final_app/models/movies_model.dart';
import 'package:kodchakorn_final_app/pages/movies_add_page.dart';
import 'package:kodchakorn_final_app/pages/movies_detail_page.dart';
import 'package:kodchakorn_final_app/pages/movies_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MoviesProvider()),
      ChangeNotifierProvider(create: (context) => BookingsProvider()),
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
      initialRoute: '/movies',
      routes: {
        '/movies': (context) => MoviesListPage(),
        '/addmoivie': (context) => BookingPage(),
      },
    );
  }
}
