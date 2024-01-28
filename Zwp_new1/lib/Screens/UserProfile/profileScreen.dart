import 'package:authapp/Screens/UserProfile/Components/body.dart';
import 'package:authapp/Screens/UserProfile/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:authapp/Screens/UserProfile/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
