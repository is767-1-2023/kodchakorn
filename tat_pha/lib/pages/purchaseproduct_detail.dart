import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  int _sale = 0;
  double _deposit = 0;
  String _productName = "";
  int _selectedQuantity = 0;
  int _deferredDays = 15;
  bool _isFullPayment = true;

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ต้องการยกเลิกหรือไม่?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ไม่'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('ใช่'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quotation_Model>(
      builder: (context, quotationModel, child) {
        _productName = quotationModel.productName;
        int productPrice = quotationModel.productPrice;
        int productMinQuantity = quotationModel.productMinQuantity;
        String productImage = quotationModel.productImage;
        String selectedSize = quotationModel.selectedSize;
        String selectedFabric = quotationModel.selectedFabric;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('รายละเอียดขอใบเสนอราคา'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    productImage,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'ชื่อสินค้า: $_productName',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ราคา: $productPrice บาท',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'จำนวนขั้นต่ำ: $productMinQuantity ชิ้น',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'ขนาด: $selectedSize ชิ้น',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'ชนิดผ้า: $selectedFabric ชิ้น',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:
                            'จำนวนที่ต้องการผลิต (มากกว่าฟรือเท่ากับ $productMinQuantity)'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      int quantity = int.tryParse(quantityController.text) ?? 0;
                      if (quantity >= productMinQuantity) {
                        setState(() {
                          _selectedQuantity = quantity;
                          _sale = quantity * productPrice;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'กรุณาใส่จำนวนขั้นต่ำที่ผลิต $productMinQuantity ชิ้น')));
                      }
                    },
                    child: Text('ตกลง'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'ราคาทั้งหมด: $_sale บาท',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: _isFullPayment,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFullPayment = value!;
                          });
                        },
                      ),
                      Text(
                        'ชำระเต็ม',
                        style: TextStyle(fontSize: 16),
                      ),
                      Radio(
                        value: false,
                        groupValue: _isFullPayment,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFullPayment = value!;
                          });
                        },
                      ),
                      Text(
                        'จ่ายทีหลัง(เครดิตเทอม)',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  if (!_isFullPayment)
                    SizedBox(
                      height: 20,
                      child: DropdownButton<int>(
                        value: _deferredDays,
                        onChanged: (int? value) {
                          setState(() {
                            _deferredDays = value!;
                          });
                        },
                        items: [15, 30, 45, 60].map<DropdownMenuItem<int>>(
                          (int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                '$value วัน',
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  // SizedBox(height: 20),
                  // Text(
                  //   'จ่ายทีหลัง (เครดิตเทอม): 15, 30, 60 วัน',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // SizedBox(height: 20),
                  // Text(
                  //   'หมายเหตุ (ถ้ามี)',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  SizedBox(height: 20),
                  TextField(
                    controller: notesController,
                    maxLines: 1, // จำนวนบรรทัด
                    decoration: InputDecoration(
                      labelText: 'หมายเหตุ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          var quotationModel = context.read<Quotation_Model>();
                          quotationModel.addProduct({
                            'sale': _sale,
                            'deposit': _deposit,
                            'productName': _productName,
                            'selectedQuantity': _selectedQuantity,
                            'productImage': productImage,
                          });

                          Navigator.pushNamed(context,
                              '/statusquo'); // Navigate to the statusquo page
                        },
                        child: Text('ขอใบเสนอราคา'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                        child: Text('ยกเลิก'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
