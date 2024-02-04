import 'package:flutter/material.dart';

class productdetail_Model extends ChangeNotifier {
  late Factory _selectedFactory;

  productdetail_Model() {
    _selectedFactory = Factory(
      // Initialize it with a default value or appropriate instance of Factory
      image: 'default_image_path.jpg',
      rating: 0,
      factoryName: 'Default Factory',
    );
  }

  Factory get selectedFactory => _selectedFactory;

  void setSelectedFactory(Factory product) {
    _selectedFactory = product;
    print(product);
    notifyListeners();
  }
}

class Factory {
  final String image;
  // final String productName;
  final double rating;
  final String factoryName;

  Factory({
    required this.image,
    // required this.productName,
    required this.rating,
    required this.factoryName,
  });
}
