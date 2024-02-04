import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DepositPaymentPage extends StatefulWidget {
  @override
  _DepositPaymentPageState createState() => _DepositPaymentPageState();
}

class _DepositPaymentPageState extends State<DepositPaymentPage> {
  File? _image;
  String accountNumber = '2222-2222-2222-2222'; // เลขบัญชี

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('รายละเอียดการชำระเงินค่ามัดจำ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Center(
              child: Column(
                children: [
                  QrImageView(
                    data: accountNumber,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Text('แสดง QR Code ของบัญชีโอนเงิน'),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'ราคาทั้งหมดที่ต้องจ่าย',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ค่ามัดจำ', style: TextStyle(fontSize: 16)),
                Text('4450 บาท', style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ค่าจัดส่ง', style: TextStyle(fontSize: 16)),
                Text('200 บาท', style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              'โรงงาน: Burin Company',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'เลขบัญชี: 2222-2222-2222-2222',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            _image == null
                ? ElevatedButton(
                    onPressed: getImage,
                    child: Text('แนบ Slip'),
                  )
                : Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('การชำระเงินเสร็จสิ้น'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('รอผู้ขายตรวจสอบ'),
                            SizedBox(height: 20),
                            Icon(
                              Icons.check_circle,
                              color: Colors.red[200],
                              size: 60,
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/order'); // ไปยังหน้าแรก
                            },
                            child: Text('ตกลง'),
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
                  'ยืนยันการชำระเงิน',
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
