import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tat_pha/details/edit_purchase_page.dart';
import 'package:tat_pha/models/quotation_model.dart';

// class StatusQuotation extends StatefulWidget {
//   @override
//   State<StatusQuotation> createState() => _StatusQuotationState();
// }

// class _StatusQuotationState extends State<StatusQuotation> {
//   // ฟังก์ชันสำหรับลบสินค้า
//   // void _deleteProduct(int index) {
//   //   context.read<Quotation_Model>().deleteProduct(index);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('ใบขอเสนอราคา'),
//       ),
//       body:
//           Consumer<Quotation_Model>(builder: (context, quotationModel, child) {
//         return ListView.builder(
//           itemCount: context.read<Quotation_Model>().products.length,
//           itemBuilder: (BuildContext context, int index) {
//             final product = context.read<Quotation_Model>().products[index];
//             return ListTile(
//               leading: Image.asset(product['image']),
//               title: Text(product['name']),
//               subtitle: Text(
//                   'ราคา: ${product['price']} บาท/ชิ้น จำนวน : ${product['minQuantity']} ขิ้น'),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   // เรียกฟังก์ชันที่จะลบสินค้าออก
//                   // _deleteProduct(index);
//                 },
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

class StatusQuotation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ข้อมูลใบเสนอราคา'),
      ),
      body: Consumer<Quotation_Model>(
        builder: (context, quotationModel, child) {
          var products = quotationModel.products;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              String productName = product['productName'];
              int sale = product['sale'] ?? 0;

              return ListTile(
                leading: Image.asset(
                  product['productImage'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('ชื่อสินค้า: $productName'),
                subtitle: Text('ราคาทั้งหทด: $sale บาท'),
                onTap: () {
                  // เมื่อคลิกที่รายการ, นำทางไปยังหน้าแก้ไขสินค้า
                  // Navigator.pushNamed(
                  //   context,
                  //   '/editpurchase', // ระบุ route ของหน้าแก้ไขสินค้า
                  // );
                },
              );
            },
          );
        },
      ),
    );
  }
}
