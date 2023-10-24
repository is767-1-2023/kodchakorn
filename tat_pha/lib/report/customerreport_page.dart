import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tat_pha/models/customerReport_model.dart';
import 'package:tat_pha/report/Customerdetail_page.dart';

class CustomerReport_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายงานของลูกค้า'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<CustomerReport_Model>(
        builder: (context, factoryProvider, child) {
          return ListView.builder(
            itemCount: factoryProvider.registeredFactories.length,
            itemBuilder: (context, index) {
              var customer = factoryProvider.registeredFactories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerDetail(customer: customer),
                    ),
                  );
                },
                child: ListTile(
                  title: Text('ชื่อ-นามสกุล: ${customer.name}'),
                  subtitle: Text('ชื่อโรงงาน: ${customer.factoryName}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
