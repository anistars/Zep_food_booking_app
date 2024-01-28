import 'package:flutter/material.dart';
import 'package:authapp/size_config.dart';

import 'components/body.dart';

class SignupOtpScreen extends StatefulWidget {
  static String routeName = "/signup_otp";
  final mobileno;
  final firstName;
  final lastName;
  final email;
  final password;
  final otp;
  SignupOtpScreen(
      {this.firstName,
      this.lastName,
      this.mobileno,
      this.email,
      this.password,
      this.otp});
  @override
  _SignupOtpScreenState createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends State<SignupOtpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("OTP Verification"),
      ),
      body: Body(
        mobileno: widget.mobileno,
        firstName: widget.firstName,
        lastName: widget.lastName,
        email: widget.email,
        password: widget.password,
        otp: widget.otp,
      ),
    );
  }
}
