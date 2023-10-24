import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class VerifyBuyer extends StatefulWidget {
  @override
  State<VerifyBuyer> createState() => _VerifyBuyerState();
}

class _VerifyBuyerState extends State<VerifyBuyer> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String IDcard = '';
  String email = '';
  String link = '';
  String address = '';
  MaskTextInputFormatter IDcradFormatter = MaskTextInputFormatter(
    mask: '# ## ## ##### ## #',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ยืนยันตนผู้ซื้อ'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'แบบฟอร์มการยืนยันตนผู้ซื้อ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'กรุณาใส่ชื่อ',
                  labelText: 'ชื่อ-นามสกุล',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ใส่ชื่อ-นมสกุลให้ถูกต้อง';
                  }
                  if (value.length <= 5) {
                    return 'ชื่อ-นามสกุลไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  name = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่เลขบัตรประชาชน/ผู้เสียภาษี',
                  labelText: 'เลขบัตรประชาชน/ผู้เสียภาษาษี',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                inputFormatters: [IDcradFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่เลขให้ถูกต้อง';
                  }
                  if (value.length != 19) {
                    return 'ใส่เลขไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  IDcard = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่ที่อยู่',
                  labelText: 'ที่อยู่ปัจจุบัน/ที่อยู่บริษัท',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ที่อยู่';
                  }
                  if (value.length != 19) {
                    return 'ใส่ที่อยู่ไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  address = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่อีเมลล์',
                  labelText: 'อีเมลล์ของคุณ',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่อีเมลล์';
                  }
                  if (value.length != 19) {
                    return 'ใส่อีเมลล์ไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  email = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่ลิงค์เว็บไซต์',
                  labelText: 'เว็บไซต์ของคุณ(ไม่บังคับ)',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'กรุณาใส่ที่อยู่';
                //   // }
                //   // if (value.length != 19) {
                //   //   return 'ใส่ที่อยู่ไม่ถูกต้อง';
                //   // }
                //   // return null;
                // },
                onSaved: (newValue) {
                  link = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'หนังสือรับรองบริษัท',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('อัพโหลดเอกสาร'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
