import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';

class ProductdetailPage extends StatefulWidget {
  @override
  State<ProductdetailPage> createState() => _ProductdetailPageState();
}

class _ProductdetailPageState extends State<ProductdetailPage> {
  String? _selectedSize; // Use nullable type to allow null as initial value
  String? _selectedFabric;
  @override
  void initState() {
    super.initState();
    _selectedSize = null; // Set initial value to null
    _selectedFabric = null; // Set initial value to null
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Purchase_Model>(builder: (context, purchaseModel, child) {
      String _productName = purchaseModel.productName;
      int? productPrice = purchaseModel.productPrice;
      int? productMinQuantity = purchaseModel.productMinQuantity;
      String productImage = purchaseModel.productImage;
      String productFactory = purchaseModel.productFactory;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade50,
          title: Text('รายละเอียดสินค้า'),
        ),
        body: Stack(
          children: [
            // Positioned สำหรับภาพพื้นหลัง
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 450,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380, // ปรับตำแหน่งให้เหมาะสม
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380, // ปรับตำแหน่งให้เหมาะสม
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        '$productFactory',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$_productName',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$productPrice บาท/ชิ้น',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'สั่งซื้อขั้นต่ำ: $productMinQuantity ชิ้น',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Text(
                            'ขนาด:',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          DropdownButton<String>(
                            value: _selectedSize,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedSize = newValue!;
                              });
                            },
                            items: ['S', 'M', 'L', 'XL']
                                .map<DropdownMenuItem<String>>(
                              (String size) {
                                return DropdownMenuItem<String>(
                                  value: size,
                                  child: Text(size),
                                );
                              },
                            ).toList(),
                          ),
                          SizedBox(width: 20), // ระยะห่างระหว่าง Dropdowns
                          Text(
                            'ชนิดผ้า:',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          DropdownButton<String>(
                            value: _selectedFabric,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedFabric = newValue!;
                              });
                            },
                            items: ['คอนตอน', 'ผ้าร่อง']
                                .map<DropdownMenuItem<String>>(
                              (String fabric) {
                                return DropdownMenuItem<String>(
                                  value: fabric,
                                  child: Text(fabric),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            Text(
                              'รายละเอียดของสินค้า',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'เสื้อกล้ามสำหรับผู้หญิง มีไซส์ S M L XL และมีชนิดผ้าให้เลือก 2 ชนิด คือ ผ้า contton และผ้าร่อง สินค้าพร้อมผลิตหากตีตราแบรนด์ให้แจ้งที่หมายเหตุ \n\nบริษัท Textile MONIX เป็นโรงงานที่ผลิตสินค้าภายใต้มาตราฐานในประเทศไทย',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_selectedSize == null &&
                                          _selectedFabric == null) {
                                        // If both size and fabric are not selected
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'กรุณาเลือกขนาดและชนิดผ้า'),
                                          ),
                                        );
                                      } else if (_selectedSize == null) {
                                        // If size is not selected
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('กรุณาเลือกขนาด'),
                                          ),
                                        );
                                      } else if (_selectedFabric == null) {
                                        // If fabric is not selected
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('กรุณาเลือกชนิดผ้า'),
                                          ),
                                        );
                                      } else {
                                        // If both size and fabric are selected, proceed to the 'purchase' page
                                        var purchaseModel =
                                            Provider.of<Purchase_Model>(
                                          context,
                                          listen: false,
                                        );
                                        purchaseModel.setPurchase(
                                          name: _productName,
                                          price: productPrice,
                                          minQuantity: productMinQuantity,
                                          size: _selectedSize!,
                                          fabric: _selectedFabric!,
                                        );
                                        Navigator.pushNamed(
                                            context, '/purchase');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.brown[200],
                                    ),
                                    child: Text(
                                      'สั่งซื้อสินค้า',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Request for Quotation logic
                                  //     var quotation =
                                  //         Provider.of<Purchase_Model>(
                                  //       context,
                                  //       listen: false,
                                  //     );
                                  //     quotation.requestQuotation(
                                  //         name: _productName);
                                  //     Navigator.pushNamed(context, '/RFQ');
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Colors.brown[200],
                                  //   ),
                                  //   child: Text(
                                  //     'ขอใบเสนอราคา',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
    });
  }
}
