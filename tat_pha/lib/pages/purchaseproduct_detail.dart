import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Declare form key
  TextEditingController quantityController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  int _sale = 0;
  int _selectedQuantity = 0;
  String _productName = "";
  int _deferredDays = 15;
  bool _isFullPayment = false;

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text(
                "ประกาศคณะกรรมการการแข่งขันทางการค้า เรื่อง แนวทางพิจารณาการปฏิบัติทางการค้าที่เป็นธรรมเกี่ยวกับระยะเวลาการให้สินเชื่อการค้า (Credit Term) \n กรณีผู้ประกอบธุรกิจขนาดกลางและขนาดย่อม (SMEs) เป็นผู้ขายสินค้าหรือบริการ \n สาระสำคัญของประกาศ\n 1. ระยะเวลาการให้สินเชื่อการค้า (Credit Term) ระหว่างผู้ประกอบธุรกิจรายใด ซึ่งเป็นคู่ค้ากับผู้ประกอบธุรกิจขนาดกลางและขนาดย่อม (SMEs) ภาคการค้า ภาคการผลิต และภาคบริการ ไม่เกิน ๔๕ วัน เว้นแต่ได้มีการตกลง ระยะเวลาการให้สินเชื่อการค้าที่น้อยกว่าอยู่ก่อนแล้ว\n 2.การเริ่มต้นนับระยะเวลาสินเชื่อการค้า ให้นับตั้งแต่วันส่งมอบสินค้าหรือให้บริการ ตามจำนวน ประเภท คุณภาพมาตรฐานของสินค้าหรือบริการที่ได้ตกลงกันไว้และส่งมอบเอกสารที่ถูกต้องครบถ้วน\n 3.การชำระสินเชื่อการค้า จะต้องแสดงขั้นตอนการจ่ายเงินตามแนวทางการค้าปกติให้ชัดเจน และผู้ประกอบธุรกิจ SMEs จะต้องแสดงเอกสารหลักฐานแสดงจำนวนการจ้างงาน หรือเอกสารแสดงรายได้เพื่อยืนยันสถานะการเป็นSMEs (มีการจ้างงานไม่เกินสองร้อยคน หรือมีรายได้ต่อปีไม่เกินห้าร้อยล้านบาท) ให้ผู้ประกอบธุรกิจรายใดซึ่งเป็นคู่ค้าทราบด้วย\n โดยหากมีการกระทำที่มีลักษณะเป็นการฝ่าฝัน ประกาศดังกล่าว กรณีอาจเข้าข่ายเป็นความผิดตามมาตรา 57 ประกอบมาตรา 82 แห่งพระราชบัญญัติการข่งขันทางการค้า พ.ศ. 2560 อันมีโทษปรับทางปกครองในอัตราไม่เกินร้อยละ 10 ของรายได้ในปีที่กระทำความผิด"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

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
    return Consumer<Purchase_Model>(
      builder: (context, purchaseModel, child) {
        _productName = purchaseModel.productName;
        int productPrice = purchaseModel.productPrice;
        int productMinQuantity = purchaseModel.productMinQuantity;
        String productImage = purchaseModel.productImage;
        String selectedSize = purchaseModel.selectedSize;
        String selectedFabric = purchaseModel.selectedFabric;
        String productFactory = purchaseModel.productFactory;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red.shade50,
            title: Text('สั่งซื้อสินค้า'),
          ),
          body: Stack(
            children: <Widget>[
              Positioned(
                // right: 8,
                // left: 8,
                top: 0,
                child: Container(
                  width: 415,
                  height: 800,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                // right: 8,
                // left: 8,
                top: 500,
                child: Container(
                  width: 415,
                  height: 680,
                  decoration: BoxDecoration(
                    color: Colors.red.shade100, // Yellow color at the bottom
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                      // topRight: Radius.circular(150),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 750,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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
                          'โรงงาน: $productFactory',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ชื่อสินค้า: $_productName',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                          'ขนาด: $selectedSize',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ชนิดผ้า: $selectedFabric ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Divider(
                          height: 50, // ความสูงของเส้นกั้น
                          thickness: 2, // ความหนาของเส้นกั้น
                          color: Colors.grey, // สีของเส้นกั้น
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'จำนวนที่ต้องการ (มากกว่าหรือเท่ากับ $productMinQuantity)',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextFormField(
                                      controller: quantityController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 12.0),
                                        border: OutlineInputBorder(
                                          // กำหนดกรอบของ TextField
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Colors.black), // สีขอบกรอบ
                                        ),
                                        filled: true,
                                        fillColor: Colors
                                            .white, // สีพื้นหลังของ TextField
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a value';
                                        }
                                        int quantity = int.tryParse(value) ?? 0;
                                        if (quantity < productMinQuantity) {
                                          return 'กรุณาใส่จำนวนมากกว่าหรือเท่ากับ $productMinQuantity ชิ้น';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        int quantity =
                                            int.tryParse(value!) ?? 0;
                                        _selectedQuantity = quantity;
                                        _sale = quantity * productPrice;
                                        setState(() {
                                          _sale =
                                              _selectedQuantity * productPrice;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                    },
                                    child: Text('ตกลง'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'ราคาทั้งหมด: $_sale บาท',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'จำนวนราคามัดจำที่ต้องจ่าย: ${_sale * 0.5} บาท',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 20),
                        // Row(
                        //   children: [
                        //     // ปุ่มสำหรับชำระเต็ม
                        //     Row(
                        //       children: [
                        //         Radio(
                        //           value: true,
                        //           groupValue: _isFullPayment,
                        //           onChanged: (bool? value) {
                        //             setState(() {
                        //               _isFullPayment = value!;
                        //               // Store selected payment method
                        //               context
                        //                   .read<Purchase_Model>()
                        //                   .setSelectedPaymentMethod(
                        //                       _isFullPayment);
                        //             });
                        //           },
                        //         ),
                        //         Text(
                        //           'ชำระเต็ม',
                        //           style: TextStyle(fontSize: 16),
                        //         ),
                        //       ],
                        //     ),
                        // ปุ่มสำหรับเครดิตเทอม
                        //     Row(
                        //       children: [
                        //         Radio(
                        //           value: false,
                        //           groupValue: purchaseModel.isFullPayment,
                        //           onChanged: (bool? value) {
                        //             purchaseModel
                        //                 .setSelectedPaymentMethod(true);
                        //             setState(() {
                        //               _isFullPayment = value!;
                        //               if (!_isFullPayment) {
                        //                 context
                        //                     .read<Purchase_Model>()
                        //                     .setSelectedPaymentMethod(
                        //                         _isFullPayment);
                        //               }
                        //             });
                        //           },
                        //         ),
                        //         Text(
                        //           'ระยะเวลาเครดิตเทอม ',
                        //           style: TextStyle(fontSize: 16),
                        //         ),
                        //       ],
                        //     ),
                        //     // แสดง Dropdown ถ้าไม่ได้เลือกชำระเต็ม

                        //     Expanded(
                        //       child: Visibility(
                        //         visible: !_isFullPayment,
                        //         child: Row(
                        //           children: [
                        //             DropdownButton<int>(
                        //               value: _deferredDays,
                        //               onChanged: (int? value) {
                        //                 setState(
                        //                   () {
                        //                     _deferredDays = value!;
                        //                     // Store selected deferred days
                        //                     context
                        //                         .read<Purchase_Model>()
                        //                         .setSelectedDeferredDays(
                        //                             _deferredDays);
                        //                   },
                        //                 );
                        //               },
                        //               items: [15, 30, 45]
                        //                   .map<DropdownMenuItem<int>>(
                        //                 (int value) {
                        //                   return DropdownMenuItem<int>(
                        //                     value: value,
                        //                     child: Text(
                        //                       '$value วัน',
                        //                       style: TextStyle(fontSize: 16),
                        //                     ),
                        //                   );
                        //                 },
                        //               ).toList(),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20),
                        // Container(
                        //   height: 40,
                        //   child: TextField(
                        //     controller: notesController,
                        //     maxLines: 1, // จำนวนบรรทัด
                        //     decoration: InputDecoration(
                        //       labelText: 'หมายเหตุ (ถ้ามี)',
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print(_isFullPayment);
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  var purchaseModel =
                                      context.read<Purchase_Model>();

                                  // ตั้งค่าการชำระเงินและระยะเวลาเครดิตเทอมในโมเดล Purchase
                                  purchaseModel
                                      .setSelectedPaymentMethod(_isFullPayment);
                                  purchaseModel
                                      .setSelectedDeferredDays(_deferredDays);

                                  // เพิ่มสินค้าลงในรายการผ่าน Provider
                                  purchaseModel.addProduct({
                                    'sale': _sale,
                                    'productName': _productName,
                                    'selectedQuantity': _selectedQuantity,
                                    'productImage': productImage,
                                    'productFactory': productFactory,
                                  });

                                  Navigator.pushNamed(context, '/order');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[200],
                              ),
                              child: Text(
                                'สั่งซื้อ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[200],
                              ),
                              child: Text(
                                'ยกเลิก',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'หน้าแรก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_quote),
                  label: 'ใบเสนอราคา',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'คำสั่งซื้อ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'โปรไฟล์',
                ),
              ],
              onTap: (int index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/home');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/managequotation');
                } else if (index == 2) {
                  Navigator.pushNamed(context, '/order');
                } else if (index == 3) {
                  Navigator.pushNamed(context, '/profile');
                }
              },
            ),
          ),
        );
      },
    );
  }
}
