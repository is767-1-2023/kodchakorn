import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class FourthPage extends StatefulWidget {
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>();
  String _namecard = '';
  String _number = '';
  String _cvv = '';
  String _valid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PAYMENT DETAILS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter name on card',
                  labelText: 'NAME ON CARD',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value.length <= 5) {
                    return 'Your name is too short';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _namecard = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: MaskedTextController(mask: '0000 0000 0000 0000'),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter card number',
                  labelText: 'CARD NUMBER',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your number';
                  }
                  if (value.length != 19) {
                    return 'Card number is incorrect';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _number = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: MaskedTextController(mask: '000'),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'CVV',
                        labelText: 'CVV',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter CVV';
                        }
                        if (value.length < 3) {
                          return 'CVV is incorrect';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Your input is not a number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _cvv = newValue!;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: MaskedTextController(mask: '00/00'),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'MM/YY',
                        labelText: 'VALID THROUGH',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date';
                        }
                        if (value.length < 5) {
                          return 'Your date is incorrect';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _valid = newValue!;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Payment Successful!'),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmPayment(
                              detail: PaymentDetail(
                                _namecard,
                                _number,
                                _cvv,
                                _valid,
                              ),
                            ),
                          ),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  child: const Text(
                    'PAYMENT',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPayment extends StatelessWidget {
  final PaymentDetail detail;
  const ConfirmPayment({super.key, required this.detail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Confirm Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(detail.name),
            Text(detail.cardnumber),
            Text(detail.cvv),
            Text(detail.validDate),
          ],
        ),
      ),
    );
  }
}

class PaymentDetail {
  final String name;
  final String cardnumber;
  final String cvv;
  final String validDate;

  const PaymentDetail(this.name, this.cardnumber, this.cvv, this.validDate);
}
