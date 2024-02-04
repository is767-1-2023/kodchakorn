import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';

class RequestPage extends StatefulWidget {
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('รายการคำขอใบเสนอราคา'),
      ),
      body: Consumer<Purchase_Model>(
        builder: (context, quotationModel, child) {
          var products = quotationModel.products;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              String productName = product['productName'];
              int sale = product['sale'] ?? 0;

              return ListTile(
                leading: Image.asset(
                  product['productImage'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('ชื่อสินค้า: $productName'),
                subtitle: Text('ราคาทั้งหมด: $sale บาท'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/requestdetail', // ระบุ route ของหน้าแก้ไขสินค้า
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        //แถบล่างที่กดปุ่ม
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
              icon: Icon(Icons.request_quote_rounded),
              label: 'ใบเสนอราคา',
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
              Navigator.pushNamed(context, '/statusquo');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
        ),
      ),
    );
  }
}
