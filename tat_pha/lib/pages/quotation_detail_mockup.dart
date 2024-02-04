import 'package:flutter/material.dart';

class detailquotation2Page extends StatelessWidget {
  final List<Map<String, dynamic>> localQuotation = [
    {
      'imagePath': 'images/Q1',
      'nameFactoryofQuotation': 'Bear Bee Company',
      'minQTY': '90 ชิ้น',
      'pricePerPiece': '100 บาทต่อชิ้น',
      'dateTime': '2023-12-10',
    },
    {
      'imagePath': 'images/Q2',
      'nameFactoryofQuotation': 'K.P. Clothing Company',
      'minQTY': '90 ชิ้น',
      'pricePerPiece': '90 บาทต่อชิ้น',
      'dateTime': '2023-12-11',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('รายละเอียดใบเสนอราคา'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ชื่อสินค้า: เสื้อเชิ้ตสีฟ้า',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ขนาด: xs อก 29,s อก 32',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'จำนวน: 90',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'รายละเอียดเพิ่มเติม: ต้องการ xs 30 ชิ้น s 60 ชิ้น เนื้อผ้าขอเป็นผ้าฝ้าย',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/Q1.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'วันที่โพสต์: 2023-12-08 09:45',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'หมดอายุ: 2023-12-23 09:45',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(), // เพิ่มเส้นแบ่งระหว่างข้อมูล

            ListView.builder(
              shrinkWrap: true,
              itemCount: localQuotation.length,
              itemBuilder: (BuildContext context, int index) {
                final quotation = localQuotation[index];
                return Card(
                  color: Colors.deepOrange.shade100,
                  child: ListTile(
                    leading: Image.asset(
                      '${quotation['imagePath']}.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(quotation['nameFactoryofQuotation']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('จำนวน: ${quotation['minQTY']}'),
                        Text('ราคาต่อชิ้น: ${quotation['pricePerPiece']}'),
                        Text('วันที่: ${quotation['dateTime']}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/detailfactoryquotation');
                    },
                  ),
                );
              },
            ),
          ],
        ),
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
