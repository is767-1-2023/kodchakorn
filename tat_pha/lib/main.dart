import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/details/addproduct_page.dart';
import 'package:tat_pha/details/detail_history.dart';
import 'package:tat_pha/details/productdetail_page.dart';
// import 'package:tat_pha/details/edit_purchase_page.dart';
import 'package:tat_pha/details/quotationdeatail_page.dart';
import 'package:tat_pha/models/customerReport_model.dart';
import 'package:tat_pha/models/productdetail_model.dart';
import 'package:tat_pha/pages/category_page.dart';
import 'package:tat_pha/pages/factory_page.dart';
import 'package:tat_pha/pages/filter_factory_page.dart';
import 'package:tat_pha/pages/history_page.dart';
import 'package:tat_pha/pages/home_page.dart';
import 'package:tat_pha/pages/profile_page.dart';
import 'package:tat_pha/pages/purchaseproduct_detail.dart';
import 'package:tat_pha/pages/regist_factory_page.dart';
import 'package:tat_pha/pages/status_quo_page.dart';
import 'package:tat_pha/pages/sweater_page.dart';
import 'package:tat_pha/pages/swimwear_page.dart';
import 'package:tat_pha/models/quotation_model.dart';
import 'package:tat_pha/pages/tax_page.dart';
import 'package:tat_pha/pages/verify_buyer.dart';
import 'package:tat_pha/report/customerreport_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Quotation_Model()),
      ChangeNotifierProvider(create: (context) => CustomerReport_Model()),
      ChangeNotifierProvider(create: (context) => productdetail_Model()),
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF81C4F7),
          selectedLabelStyle: TextStyle(
            fontSize: 14, // ปรับขนาด
            // fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14, // ปรับขนาด
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/factory': (context) => FactoryPage(),
        '/category': (context) => CategoryPage(),
        '/statusquo': (context) => StatusQuotation(),
        '/profile': (context) => ProfilePage(),
        '/registfactory': (context) => RegistFactory(),
        '/filter': (context) => FilterFactory(),
        '/swimwear': (context) => SwimwearPage(),
        '/sweater': (context) => SweaterPage(),
        '/customerRe': (context) => CustomerReport_Page(),
        '/addproduct': (context) => addProduct_page(),
        '/quotationdetail': (context) => QuotationDetailPage(),
        '/purchase': (context) => PurchasePage(),
        '/verifybuyer': (context) => VerifyBuyer(),
        '/history': (context) => HistoryPage(),
        '/detailhistory': (context) => detailhistoryPage(),
        '/taxpage': (context) => TaxPage(),
        '/productdetail': (context) => ProductdetailPage(),
      },
    );
  }
}
