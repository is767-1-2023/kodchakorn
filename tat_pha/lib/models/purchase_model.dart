import 'package:flutter/material.dart';

class Purchase_Model extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  String productName = '';
  String productFactory = '';
  int productPrice = 0;
  int productMinQuantity = 0;
  String productImage = '';
  int? _sale;
  int? selectedQuantity;
  int? get saleValue => _sale;
  int? get selectedQuantityValue => _selectedQuantity;
  int quantity = 0;
  String selectedSize = '';
  String selectedFabric = '';
  int? _selectedQuantity;
  bool _isFullPayment = true;
  bool get isFullPayment => _isFullPayment;
  int _deferredDays = 15;
  int get deferredDays => _deferredDays;
  bool? _selectedPaymentMethod;
  int? _selectedDeferredDays;

  void setSelectedPaymentMethod(bool value) {
    _selectedPaymentMethod = value;
    notifyListeners();
  }

  void setSelectedDeferredDays(int value) {
    _selectedDeferredDays = value;
    notifyListeners();
  }

  void addProduct(Map<String, dynamic> product) {
    product['isFullPayment'] = _selectedPaymentMethod;
    product['deferredDays'] = _selectedDeferredDays;

    _products.add(product);
    notifyListeners();
  }

  void setProductDetails(String name, int price, int minQuantity, String image,
      String factoryName) {
    productName = name;
    productPrice = price;
    productMinQuantity = minQuantity;
    productImage = image;
    productFactory = factoryName;
    notifyListeners();
  }

  void setPurchase({
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

  OrderDetails? _orderDetails;
  OrderDetails? get orderDetails => _orderDetails;

  void setOrderDetails(OrderDetails orderDetails) {
    _orderDetails = orderDetails;
    notifyListeners();
  }

  void requestQuotation({
    required String name,
  }) {
    productName = name;
  }

  void cancelOrder(String productName) {
    var canceledOrderIndex = _products.indexWhere(
      (product) => product['productName'] == productName,
    );

    if (canceledOrderIndex != -1) {
      // Remove the canceled order from the list
      _products.removeAt(canceledOrderIndex);
      notifyListeners();
    }
  }
}

class OrderDetails {
  final int sale;
  final String productName;
  final int selectedQuantity;
  final String productImage;
  final String nameFactory;

  OrderDetails({
    required this.sale,
    required this.productName,
    required this.selectedQuantity,
    required this.productImage,
    required this.nameFactory,
  });
}
