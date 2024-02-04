import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';

class managequotationPage extends StatefulWidget {
  @override
  State<managequotationPage> createState() => _managequotationPageState();
}

class _managequotationPageState extends State<managequotationPage> {
  String dropdownValue = 'ใบเสนอราคาทั้งหมดของฉัน';
  final List<Map<String, dynamic>> localQuotation = [
    {
      'nameProduct': 'เสื้อเชิ้ตสีฟ้า',
      'reStatus': '2 ใบเสนอราคาที่ได้รับ',
    },
  ];

  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as RouteArguments?;
    if (args != null && dropdownValue != args.dropdownValue) {
      setState(() {
        dropdownValue = args.dropdownValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quotation_Model>(
      builder: (context, quotationModel, child) {
        List<QuotationItem> quotations = quotationModel.quotations;
        List<Map<String, dynamic>> factoryData = quotationModel.factory;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red.shade50,
            title: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'ใบเสนอราคาทั้งหมดของฉัน',
                  'สินค้าตัวอย่าง',
                  'ยอมรับข้อเสนอ',
                  'รอการชำระเงิน',
                  'ใบเสนอราคาที่ปิดแล้ว',
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
          ),
          body: dropdownValue == 'ใบเสนอราคาทั้งหมดของฉัน'
              ? ListView.builder(
                  itemCount: quotations.length + localQuotation.length,
                  itemBuilder: (context, index) {
                    if (index < quotations.length) {
                      QuotationItem quotation = quotations[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detailquotation');
                        },
                        child: Column(
                          children: [
                            Card(
                              color: Colors.deepOrange.shade100,
                              child: ListTile(
                                title: Text(
                                  '${quotation.nameProduct}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '0 ใบเสนอราคาที่ได้รับ',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      var localQIndex = index - quotations.length;
                      var localQuotationItem = localQuotation[localQIndex];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detailquotation2');
                        },
                        child: Card(
                          color: Colors.deepOrange.shade100,
                          child: ListTile(
                            title: Text(
                              '${localQuotationItem['nameProduct']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${localQuotationItem['reStatus']}',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
              : dropdownValue == 'สินค้าตัวอย่าง' ||
                      dropdownValue == 'ขอตัวอย่าง'
                  ? ListView.builder(
                      itemCount: factoryData.length,
                      itemBuilder: (context, index) {
                        final factoryItem = factoryData[index];
                        print(factoryItem);
                        return Card(
                          color: Colors.deepOrange.shade100,
                          child: ListTile(
                            title: Text(
                              '${factoryItem['nameProductoffer']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'โรงงาน: ${factoryItem['nameFactoryofQuotation']}'),
                                Text('ราคา: ${factoryItem['pricePerPiece']}'),
                                Text('วันที่: ${factoryItem['dateTime']}'),
                              ],
                            ),
                            onTap: () {
                              // Handle onTap action for factory data
                            },
                          ),
                        );
                      },
                    )
                  // : dropdownValue == 'ยอมรับข้อเสนอ'
                  //     ? ListView.builder(
                  //         itemCount: factoryData.length,
                  //         itemBuilder: (context, index) {
                  //           final factoryItem = factoryData[index];
                  //           int totalPrice = factoryItem['pricePerPiece'] *
                  //               factoryItem['minQTY'];
                  //           print(factoryItem);
                  //           return Card(
                  //             color: Colors.deepOrange.shade100,
                  //             child: ListTile(
                  //               title: Text(
                  //                 '${factoryItem['nameProductoffer']}',
                  //                 style: TextStyle(fontWeight: FontWeight.bold),
                  //               ),
                  //               subtitle: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                       'โรงงาน: ${factoryItem['nameFactoryofQuotation']}'),
                  //                   Text('ราคาทั้งหมดที่ต้องจ่าย: $totalPrice'),
                  //                 ],
                  //               ),
                  //               onTap: () {
                  //                 // Handle onTap action for factory data
                  //               },
                  //             ),
                  //           );
                  //         },
                  //       )
                  : Container(),
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

class RouteArguments {
  final String dropdownValue;

  RouteArguments(this.dropdownValue);
}
