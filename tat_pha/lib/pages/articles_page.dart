import 'package:flutter/material.dart';

class articlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('ชนิดของผ้าต่างกันไหม?'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildFabricInfo(
            imagePath:
                'https://f.btwcdn.com/store-41659/product/ddfe1fa4-c84e-303f-a7cb-5f0d730793fa.jpg',
            title: 'ผ้าไหม',
            description:
                'เส้นใยธรรมชาติที่ล้ำค่าอย่างผ้าไหมถูกนำมาใช้สำหรับการออกแบบเครื่องแต่งกายทั่วทุกมุมโลกตั้งแต่โบราณ เส้นใยชนิดนี้มีสัมผัสที่นุ่มละมุน และยังมีความแวววาวในตัวมันเอง เมื่อถูกนำมาใช้ออกแบบเครื่องแต่งกายแล้วจะให้ความรู้สึกหรูหรา ทำให้ในอดีตผ้าไหมมักถูกนำมาใช้ออกแบบเครื่องแต่งกายในราชสำนักทั่วโลก แต่ในปัจจุบันนิยมใช้สำหรับออกแบบชุดกลางคืน หรือเสื้อโปโลสำหรับการทำกิจกรรมที่อาศัยความคล่องตัวสูง ทั้งนี้ความนุ่มสบายของผ้าไหมจะขึ้นอยู่กับเบอร์เส้นด้ายที่ยิ่งสูงจะยิ่งนุ่มสบายมากขึ้น',
          ),
          _buildFabricInfo(
            imagePath:
                'https://th.yutaitextiles.com/uploads/202235354/100-cotton-single-jersey57307854115.jpg',
            title: 'ผ้าฝ้าย',
            description:
                'ผ้าฝ้ายหรือคอตตอนเป็นผ้าที่เหมาะกับเมืองอากาศร้อนอย่างประเทศไทยมาก เพราะมีความยืดหยุ่นสูง อีกทั้งยังระบายอากาศได้ค่อนข้างดี และช่วยดูดซับเหงื่อได้ดี จึงนิยมนำมาทำเป็นเสื้อยืด หรือเสื้อโปโลสำหรับการทำกิจกรรมที่อาศัยความคล่องตัวสูง ทั้งนี้ความนุ่มสบายของผ้าฝ้ายจะขึ้นอยู่กับเบอร์เส้นด้ายที่ยิ่งสูงจะยิ่งนุ่มสบายมากขึ้',
          ),
          _buildFabricInfo(
            imagePath:
                'https://www.unlockmen.com/wp-content/uploads/2016/03/160321-Linen-1.jpg',
            title: 'ผ้าลินิน',
            description:
                'ผ้าชนิดนี้เป็นผ้าที่มีคุณสมบัติคล้ายคลึงกับผ้าฝ้ายนั่นคือระบายความร้อนได้ดี แต่ที่พิเศษยิ่งขึ้นเพราะให้ความรู้สึกเย็นสบายมากกว่าเมื่อสวมใส่ ไม่ดูดซับความชื้นและกลิ่น และยังมีเส้นใยที่เหนียวทนทานมากกว่า ผ้าลินินจึงเป็นตัวเลือกอันดับแรกๆ สำหรับแบรนด์เสื้อผ้าที่จะผลิตเสื้อผ้าในคอลเล็กชั่นฤดูร้อน แต่ทั้งนี้อาจจะต้องทำความเข้าใจกับเนื้อผ้าชนิดนี้ที่มีความแข็งตัวและยับได้ง่าย หากไม่ชอบสัมผัสผ้าที่อาจจะไม่ลื่นกับผิวก็ต้องพิจารณาการเลือกใช้ด้วย',
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
            child: Text(
              'ค้นหาสินค้าเลย คลิก!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // ตั้งค่าสีของข้อความเป็นสีดำที่นี่
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.brown[200],
              textStyle: TextStyle(fontSize: 16),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
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
  }

  Widget _buildFabricInfo({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Image.network(
          imagePath,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16.0),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16.0),
        Divider(),
      ],
    );
  }
}
