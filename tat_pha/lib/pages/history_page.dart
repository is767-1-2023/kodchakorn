import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ประวัติคำสั่งซื้อ'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          Order order = orders[index];
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/detailhistory');
            },
            leading: Image.asset(order.imagePath, width: 50, height: 50),
            title: Text('เลขที่คำสั่งซื้อ: ${order.orderNumber}'),
            subtitle:
                Text('สินค้า: ${order.productName}\nราคา: ${order.price} บาท'),
          );
        },
      ),
    );
  }
}

class Order {
  final int orderNumber;
  final String productName;
  final double price;
  final String imagePath;

  Order(this.orderNumber, this.productName, this.price, this.imagePath);
}

List<Order> orders = [
  Order(093489, 'เสื้อกล้าม', 200000, 'images/C1.jpg'),
  Order(034586, 'ชุดว่ายน้ำ', 500000, 'images/C2.jpg'),
];
