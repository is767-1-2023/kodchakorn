import 'package:flutter/material.dart';

class productdetail_Model extends ChangeNotifier {
  late Product _selectedProduct;

  Product get selectedProduct => _selectedProduct;

  void setSelectedProduct(Product product) {
    _selectedProduct = product;
    print(product);
    notifyListeners();
  }
}

class Product {
  final String image;
  final String productName;
  final int price;

  Product({
    required this.image,
    required this.productName,
    required this.price,
  });
}
