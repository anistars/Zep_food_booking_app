import 'package:authapp/Screens/ChangePassword/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = "/changePassword";
  final mobileno, otp;
  ChangePassword({this.mobileno, this.otp});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        mobileno: widget.mobileno,
      ),
    );
  }
}
