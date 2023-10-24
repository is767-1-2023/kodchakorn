import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Quotation_Model extends ChangeNotifier {
//   final List<Map<String, dynamic>> _products = [];
//   List<Map<String, dynamic>> get products => _products;
//   void deleteProduct(int index) {
//     _products.removeAt(index);
//     notifyListeners();
//   }

//   List<Map<String, dynamic>> get productslist => _products;
//   void addProduct(Map<String, dynamic> product) {
//     _products.add(product);
//     // print(product);
//     // print(_products);
//     notifyListeners();
//   }
// }
class Quotation_Model extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  String productName = '';
  int productPrice = 0;
  int productMinQuantity = 0;
  String productImage = '';
  int sale = 0;
  int quantity = 0;
  String selectedSize = '';
  String selectedFabric = '';

  void addProduct(Map<String, dynamic> product) {
    _products.add(product);
    notifyListeners();
  }

  void onSaved(String productname, int sale, int quantity) {
    this.productName = productname;
    this.sale = sale;
    this.quantity = quantity;
    notifyListeners();
  }

  void setProductDetails(
      String name, int price, int minQuantity, String image) {
    productName = name;
    productPrice = price;
    productMinQuantity = minQuantity;
    productImage = image;
    notifyListeners();
  }

  void purchaseModel({
    required String name,
    required int price,
    required int minQuantity,
    required String size,
    required String fabric,
  }) {
    productName = name;
    productPrice = price;
    productMinQuantity = minQuantity;
    selectedSize = size;
    selectedFabric = fabric;
    notifyListeners();
  }
}


//   void deleteProduct(int index) {
//     _products.removeAt(index);
//     notifyListeners();
//   }

