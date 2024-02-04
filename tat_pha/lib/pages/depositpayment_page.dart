import 'package:flutter/material.dart';
import 'package:tat_pha/pages/paymentdeposit_page.dart';

class depositpaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('รายละเอียดการชำระเงิน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'images/G1.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'สายเดี่ยว',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'โรงงาน: Burin Company',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'ราคาทั้งหมด: 8900 บาท',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'ราคาค่ามัดจำ: 4450 บาท',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'ระยะเวลาจัดส่ง: 3 วัน',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'ค่าจัดส่ง: 200 บาท',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'รวมราคาที่ต้องจ่าย\nค่ามัดจำ และ ค่าจัดส่ง 4650 บาท',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepositPaymentPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[200],
                ),
                child: Text(
                  'ชำระเงิน',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
