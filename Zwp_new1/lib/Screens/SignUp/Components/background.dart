import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    Key key,
    @required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/signup_top.png'),
            width: size.width * 0.35,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/main_bottom.png'),
            width: size.width * 0.30,
          ),
          child,
        ],
      ),
    );
  }
}
