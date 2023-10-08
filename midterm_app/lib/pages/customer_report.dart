import 'package:flutter/material.dart';
import 'package:midterm_app/modles/customerReport_model.dart';
import 'package:midterm_app/pages/customerdetail_page.dart';
import 'package:provider/provider.dart';

class CustomerReport extends StatelessWidget {
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
                      builder: (context) =>
                          CustomerDetailPage(customer: customer),
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
