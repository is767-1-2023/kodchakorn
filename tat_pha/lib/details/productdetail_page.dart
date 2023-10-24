import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';

class ProductdetailPage extends StatefulWidget {
  @override
  State<ProductdetailPage> createState() => _ProductdetailPageState();
}

class _ProductdetailPageState extends State<ProductdetailPage> {
  String? _selectedSize; // Use nullable type to allow null as initial value
  String? _selectedFabric;
  @override
  void initState() {
    super.initState();
    _selectedSize = null; // Set initial value to null
    _selectedFabric = null; // Set initial value to null
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quotation_Model>(
      builder: (context, quotationModel, child) {
        String _productName = quotationModel.productName;
        int productPrice = quotationModel.productPrice;
        int productMinQuantity = quotationModel.productMinQuantity;
        String productImage = quotationModel.productImage;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('รายละเอียดสินค้า'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        productImage,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '$_productName',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$productPrice บาท/ชิ้น',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ผลิตขั้นต่ำ: $productMinQuantity ชิ้น',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          'ขนาด:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedSize,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedSize = newValue!;
                            });
                          },
                          items: ['S', 'M', 'L', 'XL']
                              .map<DropdownMenuItem<String>>(
                            (String size) {
                              return DropdownMenuItem<String>(
                                value: size,
                                child: Text(size),
                              );
                            },
                          ).toList(),
                        ),
                        SizedBox(width: 20), // ระยะห่างระหว่าง Dropdowns
                        Text(
                          'ชนิดผ้า:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedFabric,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedFabric = newValue!;
                            });
                          },
                          items: ['คอนตอน', 'ผ้าร่อง']
                              .map<DropdownMenuItem<String>>(
                            (String fabric) {
                              return DropdownMenuItem<String>(
                                value: fabric,
                                child: Text(fabric),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      'รายละเอียดของสินค้า',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'เสื้อกล้ามสำหรับผู้หญิง มีไซส์ S M L XL และมีชนิดผ้าให้เลือก 2 ชนิด คือ ผ้า contton และผ้าร่อง สินค้าพร้อมผลิตหากตีตราแบรนด์ให้แจ้งที่หมายเหตุ \n\nบริษัท Textile MONIX เป็นโรงงานที่ผลิตสินค้าภายใต้มาตราฐานในประเทศไทย',
                      style: TextStyle(fontSize: 16),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Get the instance of PurchaseModel
                          var purchaseModel = Provider.of<Quotation_Model>(
                              context,
                              listen: false);

                          // Set the product details in the PurchaseModel
                          purchaseModel.purchaseModel(
                            name: _productName,
                            price: productPrice,
                            minQuantity: productMinQuantity,
                            size: _selectedSize!,
                            fabric: _selectedFabric!,
                          );
                          Navigator.pushNamed(context, '/purchase');
                        },
                        child: Text(
                            'ใบขอเสนอราคา'), // Add this line to provide a child widget for the ElevatedButton
                      ),
                    ),
                  ]),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
        );
      },
    );
  }
}
