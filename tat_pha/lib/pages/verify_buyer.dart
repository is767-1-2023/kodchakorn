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
  String dbdlink = '';
  MaskTextInputFormatter IDcradFormatter = MaskTextInputFormatter(
    mask: '# ## ## ##### ## #',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('ยืนยันตนผู้ซื้อ'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'ใส่เลขบัตรประชาชน/ผู้เสียภาษี',
              //       labelText: 'เลขบัตรประชาชน/ผู้เสียภาษาษี',
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //     ),
              //     inputFormatters: [IDcradFormatter],
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'กรุณาใส่เลขให้ถูกต้อง';
              //       }
              //       if (value.length != 19) {
              //         return 'ใส่เลขไม่ถูกต้อง';
              //       }
              //       return null;
              //     },
              //     onSaved: (newValue) {
              //       IDcard = newValue!;
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'ใส่ที่อยู่',
              //       labelText: 'ที่อยู่ปัจจุบัน/ที่อยู่บริษัท',
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'กรุณาใส่ที่อยู่';
              //       }
              //       if (value.length != 19) {
              //         return 'ใส่ที่อยู่ไม่ถูกต้อง';
              //       }
              //       return null;
              //     },
              //     onSaved: (newValue) {
              //       address = newValue!;
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'ใส่อีเมลล์',
              //       labelText: 'อีเมลล์ของคุณ',
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'กรุณาใส่อีเมลล์';
              //       }
              //       if (value.length != 19) {
              //         return 'ใส่อีเมลล์ไม่ถูกต้อง';
              //       }
              //       return null;
              //     },
              //     onSaved: (newValue) {
              //       email = newValue!;
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'DBD Link',
                    labelText: 'ลิงค์ข้อมูลจากกรมพัฒนาธุรกิจการค้า',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (newValue) {
                    dbdlink = newValue!;
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
                  onSaved: (newValue) {
                    link = newValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'อินทราแกรม (Instagram)',
                    labelText: 'Instagram',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (newValue) {
                    link = newValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'เฟซบุ๊ค (Facebook)',
                    labelText: 'Facebook',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (newValue) {
                    link = newValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ช่องทางอื่นๆ (ถ้ามี)',
                    labelText: 'อื่นๆ',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (newValue) {
                    link = newValue!;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // ทำสิ่งที่คุณต้องการเมื่อปุ่มถูกกด
                },
                child: Text('ยินยัน'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
