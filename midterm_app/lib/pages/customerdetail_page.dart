import 'package:flutter/material.dart';
import 'package:midterm_app/pages/regist_factory_page.dart';

class CustomerDetailPage extends StatelessWidget {
  final RegisterF customer;

  CustomerDetailPage({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลลูกค้า'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ชื่อ-นามสกุล: ${customer.name}',
                style: TextStyle(fontSize: 16.0)),
            Text('ชื่อโรงงาน: ${customer.factoryName}',
                style: TextStyle(fontSize: 16.0)),
            Text('เลขประจำตัวผู้เสียภาษี: ${customer.taxNo}',
                style: TextStyle(fontSize: 16.0)),
            Text('ที่อยู่: ${customer.address}',
                style: TextStyle(fontSize: 16.0)),
            Text('ประเภทสินค้าที่ผลิต: ${customer.typeFactory}',
                style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
