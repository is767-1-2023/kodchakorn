import 'package:flutter/material.dart';
import 'package:midterm_app/modles/customerReport_model.dart';
import 'package:midterm_app/pages/category_page.dart';
import 'package:midterm_app/pages/customer_report.dart';
// import 'package:midterm_app/pages/customerdetail_page.dart';
import 'package:midterm_app/pages/factory_page.dart';
import 'package:midterm_app/pages/filter_page.dart';
import 'package:midterm_app/pages/home_page.dart';
import 'package:midterm_app/pages/profile_page.dart';
import 'package:midterm_app/pages/quotation_page.dart';
import 'package:midterm_app/pages/regist_factory_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CustomerReport_Model()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Homepage(),
        '/factory': (context) => FactoryPage(),
        '/category': (context) => CategoryPage(),
        '/quotation': (context) => QuotationPage(),
        '/profile': (context) => ProfilePage(),
        '/registfactory': (context) => RegistFactory(),
        '/filter': (context) => FilterPage(),
        '/customerRe': (context) => CustomerReport(),
        // '/customerdetail': (context) => CustomerDetailPage(),
      },
    );
  }
}
