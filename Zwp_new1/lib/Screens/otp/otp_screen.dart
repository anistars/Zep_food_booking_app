import 'package:flutter/material.dart';
import 'package:authapp/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  final mobileno, otp;
  OtpScreen({this.mobileno, this.otp});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("OTP Verification"),
      ),
      body: Body(mobileno: widget.mobileno, otp: widget.otp),
    );
  }
}
