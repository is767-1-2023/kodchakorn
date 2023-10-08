import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<MenuData> menu = [
    MenuData(Icons.app_registration, 'ลงทะเบียนโรงงาน'),
    MenuData(Icons.format_align_center, 'รายงาน'),
    MenuData(Icons.person, 'โปรไฟล์'),
    MenuData(Icons.factory, 'โรงงานเสื้อผ้า'),
    MenuData(Icons.category, 'ประเภทสินค้าที่ผลิต'),
    MenuData(Icons.request_quote, 'ใบเสนอราคา'),
    MenuData(Icons.filter_alt, 'คัดกรองโรงงาน'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Midterm App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, position) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () {
                      switch (position) {
                        case 0:
                          Navigator.pushNamed(context, '/registfactory');
                          break;
                        case 1:
                          Navigator.pushNamed(context, '/customerRe');
                          break;
                        case 2:
                          Navigator.pushNamed(context, '/quotation');
                          break;
                        case 3:
                          Navigator.pushNamed(context, '/category');
                        case 4:
                          Navigator.pushNamed(context, '/factory');
                        case 5:
                          Navigator.pushNamed(context, '/filter');
                          break;
                        case 6:
                          Navigator.pushNamed(context, '/profile');
                        default:
                      }
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  menu[position].icon,
                                  color: Color.fromARGB(255, 250, 182, 119),
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                menu[position].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              ),
                            ),
                          )
                        ],
                      ),
                    )));
          },
          itemCount: menu.length,
        ),
      ),
    );
  }
}

class MenuData {
  MenuData(this.icon, this.title);
  final IconData icon;
  final String title;
}
