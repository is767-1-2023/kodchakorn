import 'package:flutter/material.dart';

class detailhistoryPage extends StatelessWidget {
  final String orderNumber = '093489';
  final String factoryName = 'Textile MOXIN';
  final String productName = 'เสื้อกล้าม';
  final String imagePath = 'images/C1.jpg';
  final String status = 'ชำระเรียบร้อบแล้ว';
  final int quantity = 200;
  final double totalPrice = 20000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('รายละเอียดคำสั่งซื้อ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('เลขคำสั่งซื้อ: $orderNumber', style: TextStyle(fontSize: 18)),
            Text('ชื่อโรงงาน: $factoryName', style: TextStyle(fontSize: 18)),
            Text('ชื่อสินค้า: $productName', style: TextStyle(fontSize: 18)),
            Image.asset(imagePath, width: 150, height: 150),
            Text('จำนวนที่ผลิต: $quantity ชิ้น',
                style: TextStyle(fontSize: 18)),
            Text('ราคาทั้งหมด: $totalPrice บาท',
                style: TextStyle(fontSize: 18)),
            Text('สถานะ: $status', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/taxpage');
              },
              child: Text('ใบกำกับภาษี'),
            ),
          ],
        ),
      ),
    );
  }
}
