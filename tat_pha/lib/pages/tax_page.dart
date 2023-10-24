import 'package:flutter/material.dart';

class TaxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ใบกำกับภาษี'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/tax.jpg',
                width: MediaQuery.of(context).size.width),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('บันทึกภาพ'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ส่งอีเมลล์'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
