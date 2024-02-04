import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  final String userName = 'มณี';
  final String typeUser = 'ผู้ซื้อ';
  final String lastName = 'วันจันทร์';
  final TextStyle textStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('โปรไฟล์'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'ชื่อ: $userName $lastName',
              style: textStyle,
            ),
            SizedBox(height: 10),
            Text(
              'ประเภทผู้ใช้งาน: $typeUser',
              style: textStyle,
            ),
            SizedBox(height: 30),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('ยืนยันตัวตน', style: textStyle),
                    onTap: () {
                      Navigator.pushNamed(context, '/verifybuyer');
                    },
                  ),
                  ListTile(
                    title: Text('ลงทะเบียนเป็นผู้ขาย', style: textStyle),
                    onTap: () {
                      Navigator.pushNamed(context, '/registfactory');
                    },
                  ),
                  ListTile(
                    title: Text('คำสั่งซื้อของฉัน', style: textStyle),
                    onTap: () {
                      Navigator.pushNamed(context, '/order');
                    },
                  ),
                  ListTile(
                    title: Text('ใบขอเสนอราคาของฉัน', style: textStyle),
                    onTap: () {
                      Navigator.pushNamed(context, '/managequotation');
                    },
                  ),
                  ListTile(
                    title: Text('หน้าแรก', style: textStyle),
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    title: Text('ออกจากระบบ', style: textStyle),
                    onTap: () {
                      // เพิ่มโค้ดที่ต้องการให้ทำเมื่อคลิกออกจากระบบ
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
