import 'package:flutter/material.dart';
import 'package:authapp/Screens/checkput_page/Components/body.dart';

class CheckOutPage extends StatelessWidget {
  final amount;
  final orderCart;

  const CheckOutPage({this.amount, this.orderCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        amount: amount,
        orderCart: orderCart,
      ),
      appBar: AppBar(
        leading: BackButton(color: Colors.yellow[900]),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Checkout Page",
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
