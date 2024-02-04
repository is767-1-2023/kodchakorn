import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';
import 'package:intl/intl.dart';

class detailquotationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Quotation_Model>(
      builder: (context, quotationModel, child) {
        // Get the first item in the quotations list for demonstration
        QuotationItem? quotation = quotationModel.quotations.isNotEmpty
            ? quotationModel.quotations[0]
            : null;
        // หาวันที่โพสต์
        DateTime postDate = DateTime.now();
        DateTime expireDate = postDate.add(Duration(days: 15));

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red.shade50,
            title: Text('รายละเอียดใบเสนอราคา'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ชื่อสินค้า: ${quotation?.nameProduct ?? ""}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ขนาด: ${quotation?.reSize ?? ""}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'จำนวน: ${quotation?.reQuantity ?? ""}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'รายละเอียดเพิ่มเติม: ${quotation?.reDetail ?? ""}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                if (quotation?.pickedImage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      quotation!.pickedImage,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'วันที่โพสต์: ${DateFormat('yyyy-MM-dd HH:mm').format(postDate)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'หมดอายุ: ${DateFormat('yyyy-MM-dd HH:mm').format(expireDate)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Divider(), // เพิ่มเส้นแบ่งระหว่างข้อมูล
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
      },
    );
  }
}
