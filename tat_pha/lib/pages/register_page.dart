import 'package:flutter/material.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  Widget build(BuildContext context) {
    // Your widget tree goes here
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: Center(
        child: Text('Your registration form goes here.'),
      ),
    );
  }
}
