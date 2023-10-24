import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'images/G1.jpg',
      'name': 'เสื้อกล้าม',
      'price': 89,
      'minQuantity': 100,
    },
    {
      'image': 'images/G2.jpg',
      'name': 'ชื่อสินค้า2',
      'price': 99,
      'minQuantity': 120,
    },
    {
      'image': 'images/G3.jpg',
      'name': 'ชื่อสินค้า3',
      'price': 79,
      'minQuantity': 80,
    },
    {
      'image': 'images/G4.jpg',
      'name': 'ชื่อสินค้า4',
      'price': 69,
      'minQuantity': 150,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('โปรไฟล์'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/C2.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'โรงงาน: Textile MOX จำกัด',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'สินค้าที่ผลิต: เสื้อ, กางเกง',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/addproduct'); // ปุ่มเพิ่มสินค้า
                  },
                  child: Text('เพิ่มสินค้า'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/statusquo');
                  },
                  child: Text('รายการคำขอ'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                // childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  child: GestureDetector(
                    onTap: () {
                      var selectedProduct = products[index];
                      Provider.of<Quotation_Model>(context, listen: false)
                          .setProductDetails(
                        selectedProduct['name'],
                        selectedProduct['price'],
                        selectedProduct['minQuantity'],
                        selectedProduct['image'],
                      );
                      Navigator.pushNamed(context, '/productdetail');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          products[index]['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ชื่อสินค้า: ${products[index]['name']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'ราคา: ${products[index]['price']} บาท/ชิ้น',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'ผลิตขั้นต่ำ: ${products[index]['minQuantity']} ชิ้น',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        //แถบล่างที่กดปุ่ม
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
              icon: Icon(Icons.request_quote_rounded),
              label: 'ใบเสนอราคา',
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
              Navigator.pushNamed(context, '/statusquo');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
        ),
      ),
    );
  }
}
