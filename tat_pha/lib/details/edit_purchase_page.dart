// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tat_pha/models/quotation_model.dart';

// class EditPurchasePage extends StatefulWidget {
//   final Map<String, dynamic> product;

//   EditPurchasePage({required this.product});

//   @override
//   State<EditPurchasePage> createState() => _EditPurchasePageState();
// }

// class _EditPurchasePageState extends State<EditPurchasePage> {
//   TextEditingController quantityController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     int selectedQuantity = widget.product['selectedQuantity'] ?? 0;
//     quantityController.text = selectedQuantity.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('แก้ไขจำนวนที่ต้องการผลิต'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'ชื่อสินค้า: ${widget.product['productName']}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: quantityController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   labelText:
//                       'จำนวนที่ต้องการผลิต (มากกว่า ${widget.product['productMinQuantity']} ชิ้น)'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 int newQuantity = int.tryParse(quantityController.text) ?? 0;
//                 int productMinQuantity =
//                     widget.product['productMinQuantity'] ?? 0;

//                 if (newQuantity >= productMinQuantity) {
//                   var quotationModel = context.read<Quotation_Model>();
//                   quotationModel.updateProductDetails(
//                       widget.product, newQuantity);
//                   Navigator.pop(context); // กลับไปที่หน้าก่อนหน้านี้
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           'กรุณาใส่จำนวนที่ต้องการผลิตมากกว่าหรือเท่ากับ $productMinQuantity ชิ้น')));
//                 }
//               },
//               child: Text('บันทึก'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
