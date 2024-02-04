import 'dart:io';
import 'package:flutter/material.dart';

class Quotation_Model extends ChangeNotifier {
  List<QuotationItem> quotations = [];
  List<Map<String, dynamic>> factory = [];
  List<Map<String, dynamic>> newfactory = [];
  void savesampleProduct(Map<String, dynamic> data) {
    factory.add(data);
    notifyListeners();
  }

  void savedQuotation(
    String nameProduct,
    String reSize,
    int reQuantity,
    File pickedImage,
    String reDetail,
  ) {
    QuotationItem newQuotation = QuotationItem(
      nameProduct: nameProduct,
      reSize: reSize,
      reQuantity: reQuantity,
      reDetail: reDetail,
      pickedImage: pickedImage,
    );

    quotations.add(newQuotation);
    notifyListeners();
  }
}

class QuotationItem {
  String nameProduct;
  String reSize;
  int reQuantity;
  String reDetail;
  File pickedImage;

  QuotationItem({
    required this.nameProduct,
    required this.reSize,
    required this.reQuantity,
    required this.reDetail,
    required this.pickedImage,
  });
}
