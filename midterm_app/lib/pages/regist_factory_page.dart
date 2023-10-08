import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:midterm_app/modles/customerReport_model.dart';
import 'package:provider/provider.dart';

class RegistFactory extends StatefulWidget {
  @override
  State<RegistFactory> createState() => _RegistFactoryState();
}

class _RegistFactoryState extends State<RegistFactory> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _factoryName = '';
  String _taxNo = '';
  String _address = '';
  List<String> _selectedTypes = [];
  List<String> _availableTypes = ['เสื้อ', 'กางเกง', 'ชุดว่ายน้ำ', 'เสื้อโปโล'];

  MaskTextInputFormatter taxNumberFormatter = MaskTextInputFormatter(
    mask: '# ## ## ##### ## #', //รูปแบบในการใส่
    filter: {"#": RegExp(r'[0-9]')}, //ใส่ได้แค่ 0-9 เท่านั่น
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ลงทะเบียนโรงงาน'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'แบบฟอร์มลงทะเบียน',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const Divider(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่ชื่อ-นามสกุล',
                  labelText: 'ชื่อ-นามสกุล',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ชื่อ-นามสกุล';
                  }
                  if (value.length <= 6) {
                    return 'ชื่อ-นามสกุลของคุณไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _name = newValue!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่ชื่อโรงงาน',
                  labelText: 'ชื่อโรงงาน',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ชื่อโรงงาน';
                  }
                  if (value.length <= 6) {
                    return 'ชื่อโรงงานไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _factoryName = newValue!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่เลขประจำตัวผู้เสียภาษี',
                  labelText: 'เลขประจำตัวผู้เสียภาษี',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                inputFormatters: [taxNumberFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่เลขประจำตัวผู้เสียภาษี';
                  }
                  if (value.length != 18) {
                    return 'เลขประจำตัวผู้เสียภาษีไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _taxNo = newValue!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ใส่ที่อยู่ของโรงงาน',
                  labelText: 'ที่อยู่ของโรงงาน',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ที่อยู่ของโรงงาน';
                  }
                  if (value.length <= 15) {
                    return 'ที่อยู่ไม่ถูกต้อง';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _address = newValue!;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('เลือกประเภทสินค้าที่ผลิต'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _availableTypes.map((type) {
                  return Row(
                    children: [
                      Checkbox(
                        value: _selectedTypes.contains(type),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value) {
                              _selectedTypes.add(type);
                            } else {
                              _selectedTypes.remove(type);
                            }
                          });
                        },
                      ),
                      Text(type),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('ลงทะเบียนเรียบร้อยแล้ว!'),
                      ),
                    );
                    var customerReportModel =
                        context.read<CustomerReport_Model>();
                    customerReportModel.addFactory(RegisterF(
                      _name,
                      _factoryName,
                      '',
                      _taxNo,
                      _address,
                      _selectedTypes.join(", "),
                    ));

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushNamed(context, '/customerRe');
                    });
                  }
                },
                child: Text('ลงทะเบียน'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterF {
  String name;
  String factoryName;
  String noFactory;
  String taxNo;
  String address;
  String typeFactory;

  RegisterF(this.name, this.factoryName, this.noFactory, this.taxNo,
      this.address, this.typeFactory);
}
