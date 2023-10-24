import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, String>> imageList = [
    {'path': 'images/G1.jpg', 'title': 'ชุดว่ายน้ำ', 'page': '/swimwear'},
    {'path': 'images/G2.jpg', 'title': 'เสื้อกันหนาว', 'page': '/sweater'},
    {'path': 'images/G3.jpg', 'title': 'เสื้อคลุม', 'page': '/blazer'},
    {'path': 'images/G4.jpg', 'title': 'กระโปรง', 'page': '/skirt'},
    {'path': 'images/G5.jpg', 'title': 'กางเกง', 'page': '/pants'},
    {'path': 'images/G6.jpg', 'title': 'เสื้อยืด', 'page': '/shirt'},
    {'path': 'images/G6.jpg', 'title': 'ชุดออกกำลังกาย', 'page': '/1'},
    {'path': 'images/G6.jpg', 'title': 'เสื้อโปโล', 'page': '/1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ประเภทสินค้าที่ผลิต'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // กำหนดจำนวนคอลัมน์ใน GridView
          childAspectRatio: 0.8, // สัดส่วนของแต่ละรายการ
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          final imagePath = imageList[index]['path'] ?? '';
          final title = imageList[index]['title'] ?? '';
          final page = imageList[index]['page'] ?? '/';
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, page);
            },
            child: Card(
              elevation: 4.0, // เพิ่มเงาให้กับรายการ
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
