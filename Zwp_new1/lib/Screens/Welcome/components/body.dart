import 'package:authapp/Screens/Delivery/screen/cartmodel.dart';
import 'package:authapp/Screens/Welcome/components/backGround.dart';
import 'package:authapp/constraints.dart';
import 'package:flutter/material.dart';
import 'package:authapp/components/round_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    print(token);
    if (token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home_screen', (Route<dynamic> route) => false,
          arguments: CartModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    checkToken();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To Zep'.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              'assets/images/homeLogo.png',
              height: size.height * 0.20,
            ),
            SizedBox(height: size.height * 0.10),
            RoundButton(
              text: 'LOGIN',
              onpresed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            RoundButton(
              color: kPrimaryColor,
              text: 'SIGN UP',
              // textColor: Colors.black,
              onpresed: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ],
        ),
      ),
    );
    //it will returns the size of the whole screen height and width
  }
}
