import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';

class orderdetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('รายละเอียดคำสั่งซื้อ'),
      ),
      body: Consumer<Purchase_Model>(
        builder: (context, purchaseModel, _) {
          if (purchaseModel.orderDetails != null) {
            // String paymentMethod = purchaseModel.isFullPayment
            //     ? 'ชำระเต็ม'
            //     : 'ระยะเวลาเครดิตเทอม ${purchaseModel.deferredDays} วัน';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      purchaseModel.orderDetails!.productImage,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'โรงงาน: ${purchaseModel.orderDetails!.nameFactory}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ชื่อสินค้า: ${purchaseModel.orderDetails!.productName}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ราคาทั้งหมด: ${purchaseModel.orderDetails!.sale} บาท',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'จำนวนสินค้าทั้งหมด: ${purchaseModel.orderDetails!.selectedQuantity} ชิ้น',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ราคามัดจำที่ต้องจ่าย: ${(purchaseModel.orderDetails!.sale * 0.5).ceil()} บาท',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Text(
                  //   'วิธีการชำระเงิน: ${purchaseModel.isFullPayment ? 'ชำระเต็ม' : 'ระยะเวลาเครดิตเทอม ${purchaseModel.deferredDays} วัน'}',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    'สถานะ รอการยืนยัน',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Show confirmation dialog before cancellation
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ยกเลิกคำสั่งซื้อ'),
                              content: Text(
                                  'คุณแน่ใจที่จะยกเลิกคำสั่งซื้อใช่หรือไม่?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    purchaseModel.cancelOrder(purchaseModel
                                        .orderDetails!.productName);
                                    Navigator.of(context).pop();
                                    Navigator.pop(
                                        context); // Navigate back after cancellation
                                  },
                                  child: Text('ใช่'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ไม่'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[200],
                      ),
                      child: Text(
                        'ยกเลิกคำสั่งซื้อ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No order details available'),
            );
          }
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
}
