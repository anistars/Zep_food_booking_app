import 'dart:convert';
import 'dart:math';
import 'package:authapp/Screens/ForgotPassword/Components/background.dart';
import 'package:authapp/components/rounded_input_field.dart';
import 'package:authapp/consurl.dart';
import 'package:authapp/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:authapp/components/round_buttons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var mobileno, msg;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGround(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot Password'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.035),
              SvgPicture.asset(
                'assets/icons/forgot.svg',
                height: size.height * 0.36,
              ),
              SizedBox(height: size.height * 0.035),
              RoundedInputField(
                  hintText: 'Registered Mobile No',
                  onChanged: (value) {
                    mobileno = value;
                  },
                  inputType: TextInputType.number,
                  icon: Icons.person,
                  validator: (String value) {
                    if (value.isEmpty ||
                        value.length < 10 ||
                        value.length > 10 ||
                        !RegExp(r"^[0-9]").hasMatch(value)) {
                      return 'Enter a valid Mobile No!';
                    }
                    return null;
                  }),
              SizedBox(height: size.height * 0.035),
              RoundButton(
                text: 'SUBMIT',
                onpresed: () async {
                  if (!(_formKey.currentState.validate())) {
                    return;
                  } else {
                    // print("Procced");
                    var max = 9999;
                    var min = 1000;
                    Random random = new Random();
                    var otp = min + random.nextInt(max - min);
                    print(otp);
                    await forget(mobileno, otp);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String msg = prefs.getString("msg");
                    if (msg == "User found") {
                      print("Go");
                      await prefs.setString(mobileno, 'mobileno');
                      Navigator.pushNamed(context, '/otp',
                          arguments: Mobile(mobileno, otp));
                    } else {
                      final snackBar = SnackBar(
                        content: Text('User not found'),
                        action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
    //it will returns the size of the whole screen height and width
  }

  forget(mobileno, otp) async {
    var url = serverUrl + "/forget";
    final http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: jsonEncode({'mobileno': mobileno, 'otp': otp}),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parse = jsonDecode(response.body);
    msg = parse["msg"];
    await prefs.setString('msg', parse["msg"]);
  }
}
