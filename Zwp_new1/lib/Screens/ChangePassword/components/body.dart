import 'dart:convert';
import 'package:authapp/Screens/ChangePassword/components/background.dart';
import 'package:authapp/components/round_buttons.dart';
import 'package:authapp/components/round_password_field.dart';
import 'package:authapp/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  final mobileno;
  Body({Key key, this.mobileno});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var password, msg;
  final _formKey = GlobalKey<FormState>();
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
                "ChangePassword",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 2,
                    color: kPrimaryColor),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(height: size.height * 0.03),
              RoundPasswordField(
                  // isPassword: true,
                  onChanged: (value) {
                password = value;
              }, validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter a valid Mobile No!';
                }
                return null;
              }),
              RoundButton(
                  text: "Change Password",
                  onpresed: () async {
                    if (!(_formKey.currentState.validate())) {
                      return;
                    } else {
                      print(password);
                      await changePassword(widget.mobileno, password);
                      print(msg);
                      if (msg == "Password Updated successfully!!") {
                        final snackBar = SnackBar(
                          content: Text('Password Updated successfully!!'),
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/login", ModalRoute.withName("/login"));
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (msg == "Password is not Updated") {
                        final snackBar = SnackBar(
                          content: Text('Password is not Updated'),
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (Route<dynamic> route) => false);
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  changePassword(mobileno, password) async {
    var url = "http://10.0.2.2:3000/changePassword";
    final http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
        body: jsonEncode({"mobileno": mobileno, "newPassword": password}));
    // print(response.body);
    var parse = jsonDecode(response.body);
    msg = parse["msg"];
  }
}
