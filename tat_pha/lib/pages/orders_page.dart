import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/purchase_model.dart';
import 'package:tat_pha/pages/depositpayment_page.dart';
import 'package:tat_pha/pages/payment_full_page.dart';

class orderPage extends StatefulWidget {
  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  String dropdownValue = 'คำสั่งซื้อของฉัน';
  final List<Map<String, dynamic>> localProducts = [
    {
      'productImage': 'images/G1.jpg',
      'productFactory': 'Burin Company',
      'productName': 'สายเดี่ยว',
      'Quantity': 200,
      'sale': 17800,
      'status': 'ยกเลิกคำสั่งซื้อ',
    },
    {
      'productImage': 'images/G1.jpg',
      'productFactory': 'Burin Company',
      'productName': 'สายเดี่ยว',
      'Quantity': 100,
      'sale': 8900,
      'status': 'รอการชำระเงินค่ามัดจำ',
    },
    {
      'productImage': 'images/G1.jpg',
      'productFactory': 'Burin Company',
      'productName': 'สายเดี่ยว',
      'Quantity': 100,
      'sale': 8900,
      'status': 'คำสั่งซื้อสำเร็จแล้ว',
    },
    {
      'productImage': 'images/G1.jpg',
      'productFactory': 'Burin Company',
      'productName': 'สายเดี่ยว',
      'Quantity': 100,
      'sale': 8900,
      'status': 'รอชำระเงินทั้งหมด',
    },
    {
      'productImage': 'images/G1.jpg',
      'productFactory': 'Burin Company',
      'productName': 'สายเดี่ยว',
      'Quantity': 100,
      'sale': 8900,
      'status': 'รอการจัดส่ง',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'คำสั่งซื้อของฉัน',
                  'รอชำระเงินค่ามัดจำ',
                  'รอการจัดส่ง',
                  'รอชำระเงิน',
                  'คำสั่งซื้อที่สำเร็จ',
                  'คำสั่งซื้อที่ถูกยกเลิก',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20, // ขนาดตัวอักษร
                        color: Colors.black, // สีของตัวอักษร
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: dropdownValue == 'รอชำระเงินค่ามัดจำ'
                ? ListView.builder(
                    itemCount: localProducts
                        .where((product) =>
                            product['status'] == 'รอการชำระเงินค่ามัดจำ')
                        .length,
                    itemBuilder: (context, index) {
                      var filteredProducts = localProducts
                          .where((product) =>
                              product['status'] == 'รอการชำระเงินค่ามัดจำ')
                          .toList();
                      var product = filteredProducts[index];
                      int sale = product['sale'] ?? 0;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => depositpaymentPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.deepOrange.shade100,
                            child: ListTile(
                              leading: Image.asset(
                                product['productImage'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(product['productName']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'โรงงาน: ${(product['productFactory'])}'),
                                  Text('ราคาค่ามัดจำ: ${sale * 0.5} บาท'),
                                  Text('จำนวน: ${product['Quantity']}'),
                                  Text('สถานะ: ${product['status']}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : dropdownValue == 'รอการจัดส่ง'
                    ? ListView.builder(
                        itemCount: localProducts
                            .where(
                                (product) => product['status'] == 'รอการจัดส่ง')
                            .length,
                        itemBuilder: (context, index) {
                          var filteredProducts = localProducts
                              .where((product) =>
                                  product['status'] == 'รอการจัดส่ง')
                              .toList();
                          var product = filteredProducts[index];
                          int sale = product['sale'] ?? 0;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.deepOrange.shade100,
                              child: ListTile(
                                leading: Image.asset(
                                  product['productImage'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product['productName']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'โรงงาน: ${(product['productFactory'])}'),
                                    Text('ราคาทั้งหมด: $sale บาท'),
                                    Text('จำนวน: ${product['Quantity']} ชิ้น'),
                                    Text('สถานะ: ${product['status']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : dropdownValue == 'คำสั่งซื้อที่ถูกยกเลิก'
                        ? ListView.builder(
                            itemCount: localProducts
                                .where((product) =>
                                    product['status'] == 'ยกเลิกคำสั่งซื้อ')
                                .length,
                            itemBuilder: (context, index) {
                              var filteredProducts = localProducts
                                  .where((product) =>
                                      product['status'] == 'ยกเลิกคำสั่งซื้อ')
                                  .toList();
                              var product = filteredProducts[index];
                              int sale = product['sale'] ?? 0;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.deepOrange.shade100,
                                  child: ListTile(
                                    leading: Image.asset(
                                      product['productImage'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(product['productName']),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'โรงงาน: ${(product['productFactory'])}'),
                                        Text('ราคาทั้งหมด: $sale บาท'),
                                        Text(
                                            'จำนวน: ${product['Quantity']} ชิ้น'),
                                        Text('สถานะ: ${product['status']}'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : dropdownValue == 'รอชำระเงิน'
                            ? ListView.builder(
                                itemCount: localProducts
                                    .where((product) =>
                                        product['status'] ==
                                        'รอชำระเงินทั้งหมด')
                                    .length,
                                itemBuilder: (context, index) {
                                  var filteredProducts = localProducts
                                      .where((product) =>
                                          product['status'] ==
                                          'รอชำระเงินทั้งหมด')
                                      .toList();
                                  var product = filteredProducts[index];
                                  int sale = product['sale'] ?? 0;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FullPaymentPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.deepOrange.shade100,
                                        child: ListTile(
                                          leading: Image.asset(
                                            product['productImage'],
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                          title: Text(product['productName']),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'โรงงาน: ${(product['productFactory'])}'),
                                              Text(
                                                  'ราคาที่ต้องจ่ายหักค่ามัดจำ: ${sale - (sale * 0.5)} บาท'),
                                              Text(
                                                  'จำนวน: ${product['Quantity']}'),
                                              Text(
                                                  'สถานะ: ${product['status']}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : dropdownValue == 'คำสั่งซื้อที่สำเร็จ'
                                ? ListView.builder(
                                    itemCount: localProducts
                                        .where((product) =>
                                            product['status'] ==
                                            'คำสั่งซื้อสำเร็จแล้ว')
                                        .length,
                                    itemBuilder: (context, index) {
                                      var filteredProducts = localProducts
                                          .where((product) =>
                                              product['status'] ==
                                              'คำสั่งซื้อสำเร็จแล้ว')
                                          .toList();
                                      var product = filteredProducts[index];
                                      int sale = product['sale'] ?? 0;
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FullPaymentPage(),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            color: Colors.deepOrange.shade100,
                                            child: ListTile(
                                              leading: Image.asset(
                                                product['productImage'],
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                              title:
                                                  Text(product['productName']),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'โรงงาน: ${(product['productFactory'])}'),
                                                  Text(
                                                      'ราคาทั้งหมด: $sale บาท'),
                                                  Text(
                                                      'จำนวน: ${product['Quantity']} ชิ้น'),
                                                  Text(
                                                      'สถานะ: ${product['status']}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Consumer<Purchase_Model>(
                                    builder: (context, purchaseModel, child) {
                                      var products = purchaseModel.products;
                                      var filteredProducts =
                                          products.where((product) {
                                        if (dropdownValue ==
                                            'คำสั่งซื้อของฉัน') {
                                          return true;
                                        } else {
                                          return product['status'] ==
                                              dropdownValue;
                                        }
                                      }).toList();

                                      return ListView.builder(
                                        itemCount: filteredProducts.length,
                                        itemBuilder: (context, index) {
                                          var product = filteredProducts[index];
                                          int sale = product['sale'] ?? 0;
                                          return product['canceled'] ?? false
                                              ? SizedBox
                                                  .shrink() // Hides canceled orders
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    color: Colors
                                                        .deepOrange.shade100,
                                                    child: ListTile(
                                                      leading: Image.asset(
                                                        product['productImage'],
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      title: Text(product[
                                                          'productName']),
                                                      subtitle: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'โรงงาน: ${(product['productFactory'])}'),
                                                          Text(
                                                              'ราคาทั้งหมด: $sale บาท'),
                                                          Text(
                                                              'จำนวน: ${product['selectedQuantity']}'),
                                                          Text(
                                                              'สถานะ: รอการยืนยัน'),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        Provider.of<Purchase_Model>(
                                                                context,
                                                                listen: false)
                                                            .setOrderDetails(
                                                          OrderDetails(
                                                            sale:
                                                                product['sale'],
                                                            productName: product[
                                                                'productName'],
                                                            selectedQuantity:
                                                                product[
                                                                    'selectedQuantity'],
                                                            productImage: product[
                                                                'productImage'],
                                                            nameFactory: product[
                                                                'productFactory'],
                                                          ),
                                                        );
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/orderdetail');
                                                      },
                                                    ),
                                                  ),
                                                );
                                        },
                                      );
                                    },
                                  ),
          ),
        ],
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

class RouteArguments {
  final String dropdownValue;

  RouteArguments(this.dropdownValue);
}
