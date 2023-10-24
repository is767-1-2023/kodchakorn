import 'package:flutter/material.dart';
import 'package:tat_pha/pages/regist_factory_page.dart';

class CustomerReport_Model extends ChangeNotifier {
  List<RegisterF> _registeredFactories = [];

  List<RegisterF> get registeredFactories => _registeredFactories;

  void addFactory(RegisterF factory) {
    _registeredFactories.add(factory);
    notifyListeners();
  }
}
