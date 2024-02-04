import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';
import 'dart:io';

import 'package:tat_pha/pages/quotation_manage_page.dart';

class requestquotationPage extends StatefulWidget {
  @override
  State<requestquotationPage> createState() => _requestquotationPageState();
}

class _requestquotationPageState extends State<requestquotationPage> {
  TextEditingController productTypeController = TextEditingController();
  List<String> productTypes = [
    'เสื้อ',
    'กางเกง',
    'เสื้อกันหนาว',
    'ชุดสูท',
    'ชุดว่ายน้ำ'
  ];
  // String? _selectedProducType;
  DateTime postDate = DateTime.now();
  File? _pickedImage;
  String nameProduct = '';
  String reSize = '';
  String reType = '';
  int? reQuantity;
  String reDetail = '';
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade50,
        title: Text('ขอใบเสนอราคา'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              // right: 8,
              // left: 8,
              top: 0,
              child: Container(
                width: 415,
                height: 630,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              // right: 8,
              // left: 8,
              top: 380,
              child: Container(
                width: 415,
                height: 630,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ประเภทสินค้า',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return productTypes.where((String product) {
                        return product
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (String selection) {
                      setState(() {
                        // _selectedProducType = selection;
                      });
                    },
                    fieldViewBuilder: (
                      BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'โปรดระบุประเภท',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 25.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'โปรดระบุประเภทสินค้า';
                              }
                              return null;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'จำนวนที่ต้องการหา (ชิ้น)',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'ใส่จำนวนเป็นตัวเลข ex.10',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 25.0),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณาใส่จำนวนที่ต้องการ';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null && newValue.isNotEmpty) {
                            reQuantity = int.parse(newValue);
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ขนาดของสินค้า',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'ใส่ขนาด ex. XS อก 29, S อก 32 ',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 25.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณาใส่ขนาด';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          reSize = newValue!;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ใส่รายละเอียดสินค้า',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'ใส่อย่างน้อย 20 ตัวอักษร',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: 10, // กำหนดจำนวนบรรทัดสูงสุดที่แสดง
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาใส่รายละเอียด';
                        }
                        if (value.length <= 20) {
                          return 'ใส่อย่างน้อย 20 ตัวอักษร';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        reDetail = newValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'แนบรูปภาพเสื้อผ้าและโลโก้',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: IconButton(
                                icon: Icon(Icons.drive_folder_upload_outlined),
                                onPressed: () {
                                  _pickImage();
                                },
                              ),
                            ),
                            if (_pickedImage == null)
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(
                                    color: Colors.grey[400]!, // สีขอบ
                                    width: 2, // ความหนาของขอบ
                                  ),
                                ),
                              ),
                            if (_pickedImage != null)
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.file(
                                  _pickedImage!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  var quotationModel =
                                      context.read<Quotation_Model>();
                                  quotationModel.savedQuotation(
                                    nameProduct,
                                    reSize,
                                    reQuantity!,
                                    _pickedImage ?? File(''),
                                    reDetail,
                                  );

                                  // เมื่อบันทึกข้อมูลสำเร็จ ก็เก็บวันที่โพสต์
                                  postDate = DateTime.now();

                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/managequotation',
                                    arguments: RouteArguments(
                                        'ใบเสนอราคาทั้งหมดของฉัน'),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[200],
                              ),
                              child: Text(
                                'ยืนยันคำขอ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
  }
}
