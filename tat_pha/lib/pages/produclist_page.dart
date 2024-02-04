import 'package:flutter/material.dart';

class productlistPage extends StatelessWidget {
  final List<String> entries = [
    'images/C1.jpg',
    'images/C2.jpg',
    'images/C3.jpg',
    'images/C4.jpg',
    'images/C5.jpg',
    'images/C6.jpg',
    'images/C7.jpg',
    'images/C8.jpg',
  ];

  final List<Map<String, dynamic>> factoryData = [
    {
      'companyName': 'MOX Textile จำกัด',
      'productType': 'เสื้อ, กางเกง',
      'priceMin': 100,
      'unitMin': 50,
    },
    {
      'companyName': 'Burin Fabric จำกัด',
      'productType': 'เสื้อ',
      'priceMin': 89,
      'unitMin': 200,
    },
    {
      'companyName': 'Miaxx Fabric จำกัด',
      'productType': 'เสื้อยืด, กางเกง',
      'priceMin': 59,
      'unitMin': 300,
    },
// เพิ่มข้อมูลโรงงานและประเภทสินค้าอื่นๆ
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade50,
          title: Text('โรงงานเสื้อผ้า'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'แนะนำ'),
              Tab(text: 'ยอดนิยม'),
            ],
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
                height: 630, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade100,
                  //color: Colors.red.shade100,
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
              top:
                  380, // Adjust the top position to create a gap between blue and yellow
              child: Container(
                width: 415,
                height: 600, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  //color: Colors.deepOrange.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                  ),
                ),
              ),
            ),
            TabBarView(
              children: [
                _buildRecommendedTab(context),
                _buildPopularTab(context),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                      Navigator.pushNamed(context, '/order');
                    } else if (index == 2) {
                      Navigator.pushNamed(context, '/profile');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedTab(BuildContext context) {
    return ListView.builder(
      itemCount: factoryData.length,
      itemBuilder: (BuildContext context, int index) {
        final companyName = factoryData[index]['companyName'] ?? '';
        final productType = factoryData[index]['productType'] ?? '';
        final priceMin = factoryData[index]['priceMin'] ?? 0;
        final unitMin = factoryData[index]['unitMin'] ?? 0;

        return Container(
          padding: EdgeInsets.all(8.0),
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    entries[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โรงงาน: $companyName',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'ประเภท: $productType',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'ราคาขั้นต่ำ: $priceMin บาท/ชิ้น',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        'สั่งซื้อขั้นต่ำ: $unitMin ชิ้น',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPopularTab(BuildContext context) {
    return ListView.builder(
      itemCount: factoryData.length,
      itemBuilder: (BuildContext context, int index) {
        final companyName = factoryData[index]['companyName'] ?? '';
        final productType = factoryData[index]['productType'] ?? '';
        final priceMin = factoryData[index]['priceMin'] ?? 0;
        final unitMin = factoryData[index]['unitMin'] ?? 0;

        return Container(
          padding: EdgeInsets.all(8.0),
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    entries[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โรงงาน: $companyName',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'ประเภทสินค้า: $productType',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'ราคาขั้นต่ำ: $priceMin บาท/ชิ้น',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        'สั่งซื้อขั้นต่ำ: $unitMin ชิ้น',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
