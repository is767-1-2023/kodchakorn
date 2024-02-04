import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';
import 'package:tat_pha/pages/articles_page.dart';
import 'package:tat_pha/pages/comment_review_page.dart';
import 'package:tat_pha/pages/login_page.dart';
import 'package:tat_pha/pages/profile_page.dart';
import 'package:tat_pha/pages/quotation_detail_mockup.dart';
import 'package:tat_pha/pages/quotation_detail_page.dart';
import 'package:tat_pha/pages/quotation_manage_page.dart';
import 'package:tat_pha/pages/ordersdetail_page.dart';
import 'package:tat_pha/pages/productdetail_page.dart';
import 'package:tat_pha/models/customerReport_model.dart';
import 'package:tat_pha/existpage/category_page.dart';
import 'package:tat_pha/models/productdetail_model.dart';
import 'package:tat_pha/pages/produclist_page.dart';
import 'package:tat_pha/pages/factorystore_page.dart';
import 'package:tat_pha/pages/filter_page.dart';
import 'package:tat_pha/pages/home_page.dart';
import 'package:tat_pha/pages/purchaseproduct_detail.dart';
import 'package:tat_pha/pages/quotationfactory_detail_page.dart';
import 'package:tat_pha/pages/regist_factory_page.dart';
import 'package:tat_pha/pages/request_page.dart';
import 'package:tat_pha/pages/orders_page.dart';
import 'package:tat_pha/pages/quotation_request_page.dart';
import 'package:tat_pha/pages/sweater_page%20copy.dart';
import 'package:tat_pha/pages/swimwear_page.dart';
import 'package:tat_pha/models/purchase_model.dart';
import 'package:tat_pha/pages/tax_page.dart';
import 'package:tat_pha/pages/test_page.dart';
import 'package:tat_pha/pages/verify_buyer.dart';
import 'package:tat_pha/report/customerreport_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Purchase_Model()),
      ChangeNotifierProvider(create: (context) => CustomerReport_Model()),
      ChangeNotifierProvider(create: (context) => productdetail_Model()),
      ChangeNotifierProvider(create: (context) => Quotation_Model()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade50),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.red.shade50,
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
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/productlist': (context) => productlistPage(),
        '/category': (context) => CategoryPage(),
        '/order': (context) => orderPage(),
        '/factorystore': (context) => factorystorePage(),
        '/registfactory': (context) => RegistFactory(),
        '/filter': (context) => FilterFactory(),
        '/swimwear': (context) => SwimwearPage(),
        '/sweater': (context) => Sweaterpage(),
        '/customerRe': (context) => CustomerReport_Page(),
        '/purchase': (context) => PurchasePage(),
        '/verifybuyer': (context) => VerifyBuyer(),
        '/taxpage': (context) => TaxPage(),
        '/productdetail': (context) => ProductdetailPage(),
        '/requestlist': (context) => RequestPage(),
        '/test': (context) => TestPage(),
        '/orderdetail': (context) => orderdetailPage(),
        '/requestquotation': (context) => requestquotationPage(),
        '/managequotation': (context) => managequotationPage(),
        '/detailquotation': (context) => detailquotationPage(),
        '/detailquotation2': (context) => detailquotation2Page(),
        '/detailfactoryquotation': (context) => detialfacotyquotationlPage(),
        '/profile': (context) => profilePage(),
        '/articles': (context) => articlesPage(),
        '/login': (context) => Login(),
        '/comment': (context) => CommentReviewPage(),
      },
    );
  }
}
