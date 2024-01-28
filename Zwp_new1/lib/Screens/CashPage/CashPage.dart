import 'package:authapp/Screens/CashPage/components/body.dart';
import 'package:flutter/material.dart';

class CashPage extends StatelessWidget {
  final amount;
  final orderCart;
  final address;

  const CashPage({Key key, this.amount, this.orderCart, this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        amount: amount,
        orderCart: orderCart,
        address: address,
      ),
    );
  }
}
