import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/productdetail_model.dart';
import 'package:tat_pha/pages/factorystore_page.dart';

class HomePage extends StatelessWidget {
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
      'ratingAvg': 4.5,
      // 'unitMin': 50,
    },
    {
      'companyName': 'Burin Fabric จำกัด',
      'productType': 'เสื้อ',
      'ratingAvg': 4.9,
      // 'unitMin': 200,
    },
    {
      'companyName': 'Miaxx Fabric จำกัด',
      'productType': 'เสื้อยืด, กางเกง',
      'ratingAvg': 5.0,
      // 'unitMin': 300,
    },
    // เพิ่มข้อมูลโรงงานและประเภทสินค้าอื่นๆ
  ];

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

  final List<String> cotent = [
    'ชนิดของผ้าต่างกันไหม?',
    'เริ่มธุรกิจขนาดเล็กยังไงดี?,',
    'iขายของออนไลน์ดีไหม?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text(
          'TAT PHA',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          _buildProfileButton(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 1150,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    // right: 8,
                    // left: 8,
                    top: 0,
                    child: Container(
                      width: 415,
                      height: 800,
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
                    top: 560,
                    child: Container(
                      width: 415,
                      height: 900,
                      decoration: BoxDecoration(
                        color:
                            Colors.red.shade100, // Yellow color at the bottom
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          // topRight: Radius.circular(150),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    left: 8,
                    top: 90,
                    child: Container(
                      width: 415,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Image
                  Positioned(
                    right: 10,
                    top: 5,
                    child: Image.asset(
                      'images/Bell.jpg',
                      height: 350,
                    ),
                  ),
                  // Text
                  Positioned(
                    left: 16,
                    top: 120,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'มีแบบเสื้อผ้าที่ต้องการใช่ไหม..\nสั่งตัดเสื้อผ้ากับโรงงานสิ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // HEX color value
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to the quotation page
                                  Navigator.pushNamed(
                                      context, '/requestquotation');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .deepOrange.shade300, // สีพื้นหลังของปุ่ม
                                ),
                                child: Text(
                                  'รับใบเสนอราคาได้เลย',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white, // สีของข้อความ
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    left: 8,
                    top: 380,
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Image

                  Positioned(
                    right: -9,
                    top: 380,
                    child: Image.asset(
                      'images/Bell-2.jpg', // Replace with your image path
                      width: 150,
                      height: 150,
                    ),
                  ),
                  // Text
                  Positioned(
                    left: 16,
                    top: 390,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เสื้อผ้าสำเร็จรูปราคาส่ง\nสั่งซื้อจากโรงานผลิตเลย',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // HEX color value
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                'สั่งซื้อสินค้า คลิก ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/filter');
                                },
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  size: 35.0,
                                  color: Colors.deepOrange.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Recommended Factories ListView
                  Positioned(
                    left: 8,
                    top: 570,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'โรงงานผลิตที่แนะนำ',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/productlist');
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'แสดงทั้งหมด',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight:
                                          FontWeight.bold, // สีที่ต้องการ
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 600,
                          child: _buildPopularTab(context),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 960,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ประเภทสินค้าที่โรงงานผลิต',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 600,
                          child: _buildCategoryGrid(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

  Widget _buildPopularTab(BuildContext context) {
    return ListView.builder(
      itemCount: factoryData.length,
      itemBuilder: (context, index) {
        final companyName = factoryData[index]['companyName'] ?? '';
        final productType = factoryData[index]['productType'] ?? '';
        final ratingAvg = factoryData[index]['ratingAvg'] ?? 0;

        return GestureDetector(
          onTap: () {
            final selectedFactory = Factory(
              image: entries[index],
              factoryName: companyName,
              rating: ratingAvg,
            );
            context
                .read<productdetail_Model>()
                .setSelectedFactory(selectedFactory);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => factorystorePage()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // รูป
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    entries[index],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                // ข้อความ
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โรงงาน: $companyName',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'ประเภทสินค้าที่ผลิต: $productType',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'คะแนนนิยมโดยเฉลี่ย: $ratingAvg ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      // Text(
                      //   'สั่งซื้อขั้นต่ำ: $unitMin ชิ้น',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 40.0,
            color: Color(0xFF70BCF7),
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
        // Navigate to the profile page
        Navigator.pushNamed(context, '/profile');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'มณี วันจันทร์',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              textAlign: TextAlign.right,
            ),
            Text(
              'ผู้ซื้อ',
              style: TextStyle(fontSize: 12.0, color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildContent(BuildContext context) {
  //   final List<String> content = [
  //     'ชนิดของผ้าต่างกันไหม?',
  //     'เริ่มธุรกิจขนาดเล็กยังไงดี?',
  //     'ขายของออนไลน์ดีไหม?',
  //   ];

  //   // รายการรูปภาพที่ตรงกับแต่ละคำ
  //   final List<String> images = [
  //     'images/type-fabric.jpg',
  //     'images/online-content.jpg',
  //     'images/online-store.jpg',
  //   ];

  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pushNamed(context, '/articles');
  //     },
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: content.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: EdgeInsets.all(8.0),
  //           child: Card(
  //             color: Colors.deepOrange.shade50,
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Image.asset(
  //                     '${images[index]}',
  //                     width: 100,
  //                     height: 100,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(8.0),
  //                   child: Text(
  //                     content[index],
  //                     style: TextStyle(fontSize: 16.0),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildCategoryGrid(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // เลื่อนไปทางซ้าย
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        final imagePath = imageList[index]['path'] ?? '';
        final title = imageList[index]['title'] ?? '';
        final page = imageList[index]['page'] ?? '/';
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, page);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60.0, // ความสูงของ Container ที่กำหนดเอง
              width: 90.0, // ความกว้างของ Container ที่กำหนดเอง
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
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
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
