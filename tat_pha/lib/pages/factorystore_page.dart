import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tat_pha/models/productdetail_model.dart';
import 'package:tat_pha/models/purchase_model.dart';

class factorystorePage extends StatefulWidget {
  @override
  State<factorystorePage> createState() => _factorystorePageState();
}

class _factorystorePageState extends State<factorystorePage> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'images/G1.jpg',
      'name': 'เสื้อกล้าม',
      'price': 89,
      'minQuantity': 100,
    },
    {
      'image': 'images/G2.jpg',
      'name': 'เสื้อกันหนาว',
      'price': 130,
      'minQuantity': 120,
    },
    {
      'image': 'images/G3.jpg',
      'name': 'เบลเซอร์',
      'price': 500,
      'minQuantity': 80,
    },
    {
      'image': 'images/G4.jpg',
      'name': 'กระโปรง',
      'price': 90,
      'minQuantity': 150,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Consumer<productdetail_Model>(
          builder: (context, factoryModel, child) {
            return Text(factoryModel.selectedFactory.factoryName);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            // right: 8,
            // left: 8,
            top: 0,
            child: Container(
              width: 415,
              height: 630,
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade100,
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
            top: 380,
            child: Container(
              width: 415,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<productdetail_Model>(
                  builder: (context, factoryModel, child) {
                    return CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage(factoryModel.selectedFactory.image),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<productdetail_Model>(
                      builder: (context, factoryModel, child) {
                        return Text(
                          '${factoryModel.selectedFactory.factoryName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      'สินค้าที่ผลิต: เสื้อ, กางเกง',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'เกี่ยวกับโรงงาน: รับตัดเสื้อกางเกงตามแบบ สั่งเสื้อผ้าที่ทางโรงงานผลิตจัดจำหน่าย โรงงานผลิตเสื้อพร้อมตีตราโลโก้ให้กับองค์กรหรือบริษัท',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'คะแนนนิยมโดยเฉลี่ย : ${context.watch<productdetail_Model>().selectedFactory.rating}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              // ปุ่มไปยังหน้ารีวิวและคอมเม้นต์
              InkWell(
                onTap: () {
                  // ทำสิ่งที่คุณต้องการเมื่อกดปุ่มนี้
                  Navigator.pushNamed(context, '/comment');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.rate_review, color: Colors.black),
                    // SizedBox(width: 8),
                    Text(
                      'รีวิวและคอมเมนต์',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.grey.shade200,
                        elevation: 4,
                        child: GestureDetector(
                          onTap: () {
                            var selectedProduct = products[index];
                            Provider.of<Purchase_Model>(context, listen: false)
                                .setProductDetails(
                              selectedProduct['name'],
                              selectedProduct['price'],
                              selectedProduct['minQuantity'],
                              selectedProduct['image'],
                              selectedProduct['factoryName'],
                            );
                            Navigator.pushNamed(context, '/productdetail');
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.asset(
                                    products[index]['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'ชื่อสินค้า: ${products[index]['name']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'ราคา: ${products[index]['price']} บาท/ชิ้น',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'สั่งซื้อขั้นต่ำ: ${products[index]['minQuantity']} ชิ้น',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
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
  }
}
