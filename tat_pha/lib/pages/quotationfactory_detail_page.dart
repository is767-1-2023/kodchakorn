import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';
import 'package:tat_pha/pages/quotation_manage_page.dart';

// ignore: must_be_immutable
class detialfacotyquotationlPage extends StatelessWidget {
  List<Map<String, dynamic>> factory = [
    {
      'nameFactoryofQuotation': 'Bear Bee Company',
      'LinkDBD':
          'https://datawarehouse.dbd.go.th/company/profile/UrXq3mnMOz5rZveohbJBxv6pHUVGhWEyK0S9QJO3z7OS7o6lCKR7pnDuTiEaA05Y',
      'TypeFactory': 'เสื้อ,กางเกง,สูท',
      'address': '87/75 หมู่ที่ 5 ต.บึงคำพร้อย อ.ลำลูกกา จ.ปทุมธานี',
      'imagePath': 'images/beebear.jpg',
      'pricePerPiece': 100,
      'nameProductoffer': 'เสื้อเชิ้ตสีฟ้า',
      'typeofOrder': 'ขอใบเสนอราคา',
      'dateTime': '2023-12-11',
      'minQTY': 90,
    },
  ];

  TextStyle textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('รายละเอียดของการเสนอราคา'),
      ),
      body: ListView.builder(
        itemCount: factory.length,
        itemBuilder: (context, index) {
          final _factory = factory[index];
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Colors.deepOrange.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_factory['nameFactoryofQuotation'],
                            style: textStyle),
                        Image.asset(
                          _factory['imagePath'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text('ที่อยู่ของบริษัท: ${_factory['address']}',
                            style: textStyle),
                        Text('Link DBD: ${_factory['LinkDBD']}',
                            style: textStyle),
                        Text('ประเภทสินค้าที่ผลิต: ${_factory['TypeFactory']}',
                            style: textStyle),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.deepOrange.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_factory['nameProductoffer']}',
                            style: textStyle),
                        Image.asset(
                          'images/Q1.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text('เงื่อนไขการชำระเงิน: ชำระเต็ม', style: textStyle),
                        Text('จำนวนขั้นต่ำ : 90 ชิ้น', style: textStyle),
                        Text('ราคาต่อชิ้น (บาท) : ${_factory['pricePerPiece']}',
                            style: textStyle),
                        Text('ระยะเวลาการผลิต: 30วัน (+ - 5 วัน)',
                            style: textStyle),
                        Text('ระยะการจัดส่ง(หลังการผลิต): 10วัน',
                            style: textStyle),
                        Text(
                            'รายละเอียดสินค้า: เสื้อเชิ้ตสีฟ้ามาพร้อมกับผ้าฝ้าย ตามที่คุณต้องการ ทางโรงงานสามารถผลิตให้คุณได้',
                            style: textStyle),
                        Text('ตัวอย่างของสินค้า (freesize):ขนาดทั่วไป 32 - 36',
                            style: textStyle),
                        ButtonBar(
                          children: [
                            TextButton(
                              onPressed: () {
                                var quotationModel =
                                    context.read<Quotation_Model>();
                                quotationModel.savesampleProduct(_factory);
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/managequotation',
                                  arguments: RouteArguments('สินค้าตัวอย่าง'),
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.brown[200],
                              ),
                              child: Text(
                                'ขอตัวอย่าง',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                var quotationModel =
                                    context.read<Quotation_Model>();
                                quotationModel.savesampleProduct(_factory);
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/managequotation',
                                  arguments: RouteArguments('ยอมรับข้อเสนอ'),
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.brown[200],
                              ),
                              child: Text(
                                'ยอมรับข้อเสนอ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
