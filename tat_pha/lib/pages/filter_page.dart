import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';

class FilterFactory extends StatefulWidget {
  @override
  _FilterFactoryState createState() => _FilterFactoryState();
}

class _FilterFactoryState extends State<FilterFactory> {
  String? _selectedProductType;
  int? minQuantity;
  int? minPrice;
  int? maxPrice;
  final List<Map<String, dynamic>> products = [
    {
      'image': 'images/G1.jpg',
      'factoryName': 'Burin Company',
      'name': 'สายเดี่ยว',
      'price': 89,
      'minQuantity': 100,
    },
    {
      'image': 'images/G2.jpg',
      'name': 'เสื้อกันหนาว',
      'factoryName': ' Origin Bear Company',
      'price': 130,
      'minQuantity': 120,
    },
    {
      'image': 'images/G3.jpg',
      'name': 'เบลเซอร์',
      'factoryName': 'Stampcotton Company',
      'price': 500,
      'minQuantity': 80,
    },
    {
      'image': 'images/G4.jpg',
      'name': 'กระโปรง',
      'factoryName': 'Burin Company',
      'price': 90,
      'minQuantity': 150,
    },
  ];
  @override
  void initState() {
    super.initState();
    minQuantity = 0;
    minPrice = 0;
    maxPrice = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('เริ่มต้นสั่งสินค้ากับโรงงาน'),
      ),
      body: Stack(
        children: [
          Positioned(
            // right: 8,
            // left: 8,
            top: 0,
            child: Container(
              width: 415,
              height: 630, // Adjust the height as needed
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
          ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    ' เลือกประเภทสินค้าที่ต้องการ ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: DropdownButton<String>(
                      value: _selectedProductType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedProductType = newValue!;
                        });
                      },
                      items: [
                        'เสื้อ',
                        'กางเกง',
                        'ชุดว่ายน้ำ',
                        'เสื้อโปโล',
                        'กระโปรง',
                        'ชุดสูท'
                      ].map<DropdownMenuItem<String>>((String fabric) {
                        return DropdownMenuItem<String>(
                          value: fabric,
                          child: Text(fabric),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'จำนวนขั้นต่ำที่ต้องการ:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 150,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'จำนวนขั้นต่ำ',
                            // labelText: 'จำนวนขั้นต่ำที่ต้องการผลิต',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onSaved: (newValue) {
                            minQuantity = int.parse(newValue!);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ช่วงราคาที่ต้องการ:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ราคาต่ำสุด   ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 100,
                                height: 35,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // hintText: '0',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  onSaved: (newValue) {
                                    minPrice = int.parse(newValue!);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ราคาสูงสุด  ',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 35,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // hintText: '1000',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  onSaved: (newValue) {
                                    maxPrice = int.parse(newValue!);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // ดึงจาก firebase ไว้ค่อยทำ
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[200],
                            ),
                            child: Text(
                              'ค้นหา',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true, // เพิ่มค่า shrinkWrap เป็น true
                      physics:
                          NeverScrollableScrollPhysics(), // ใช้ NeverScrollableScrollPhysics
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 2,
                          child: GestureDetector(
                            onTap: () {
                              var selectedProduct = products[index];
                              Provider.of<Purchase_Model>(context,
                                      listen: false)
                                  .setProductDetails(
                                selectedProduct['name'],
                                selectedProduct['price'],
                                selectedProduct['minQuantity'],
                                selectedProduct['image'],
                                selectedProduct['factoryName'],
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
                                  // fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  ' ${products[index]['factoryName']} ',
                                  style: TextStyle(fontSize: 14),
                                ),
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
                        );
                      },
                    ),
                  ],
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
