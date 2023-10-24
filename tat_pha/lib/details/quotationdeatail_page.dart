import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/quotation_model.dart';

class QuotationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Quotation_Model>(
      builder: (context, quotationModel, child) {
        final product = quotationModel.products.last;

        int price = product['price'] ?? 0;
        int sale = product['sale'] ?? 0;
        double deposit = product['deposit'] ?? 0.0;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('ใบเสนอราคา'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ชื่อสินค้า: ${product['name']}'),
                Text('ราคา: $price บาท/ชิ้น'),
                TextFormField(
                  decoration: InputDecoration(labelText: 'จำนวนสินค้า'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // quotationModel.calculateAndSetValues(int.parse(value));
                  },
                ),
                Text('ราคาขาย: $sale บาท'),
                Text('มัดจำ: $deposit บาท'),
              ],
            ),
          ),
        );
      },
    );
  }
}
