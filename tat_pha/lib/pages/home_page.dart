import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('TAT PHA'),
        actions: [
          _buildProfileButton(context),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            // childAspectRatio: 1, // ความสูงเท่ากับความกว้าง
            children: <Widget>[
              _buildGridItem(
                context,
                Icons.factory,
                'โรงงานเสื้อผ้า',
                '/factory',
              ),
              _buildGridItem(
                context,
                Icons.category_rounded,
                'ประเภทสินค้าที่ผลิต',
                '/category',
              ),
              _buildGridItem(
                context,
                Icons.request_quote,
                'ใบขอเสนอราคา',
                '/statusquo',
              ),
              _buildGridItem(
                context,
                Icons.person,
                'โปรไฟล์',
                '/profile',
              ),
              _buildGridItem(
                context,
                Icons.app_registration_outlined,
                'ลงทะเบียนโรงงาน',
                '/registfactory',
              ),
              _buildGridItem(
                context,
                Icons.filter_alt,
                'คัดกรองโรงงาน',
                '/filter',
              ),
              // _buildGridItem(
              //   context,
              //   Icons.report_gmailerrorred,
              //   '',
              //   '/',
              // ),
              _buildGridItem(
                context,
                Icons.pending_actions,
                'ยืนยันตนผู้ซื้อ',
                '/verifybuyer',
              ),
              _buildGridItem(
                context,
                Icons.history,
                'ประวัติคำสั่งซื้อ',
                '/history',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildGridItem(
  BuildContext context,
  IconData iconData,
  String title,
  String routeName,
) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    // child: Card(
    //   // color: Color(0xFF81C4F7),
    //   // shape: RoundedRectangleBorder(
    //   //   borderRadius: BorderRadius.circular(100.0),
    //   ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 40.0,
          color: Color.fromARGB(255, 112, 188, 247),
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    ),
  );
}

Widget _buildProfileButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // เปิดหน้าโปรไฟล์
      Navigator.pushNamed(context, '/profile');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.end, // จัดตำแหน่งของข้อความไปทางขวา
        children: <Widget>[
          Text(
            'มณี วันจันทร์',
            style: TextStyle(fontSize: 14.0),
            textAlign: TextAlign.right,
          ),
          Text(
            'โรงงาน',
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.right, // จัดตำแหน่งของข้อความไปทางขวา
          ),
        ],
      ),
    ),
  );
}

class MenuData {
  MenuData(this.icon, this.title);
  final IconData icon;
  final String title;
}
