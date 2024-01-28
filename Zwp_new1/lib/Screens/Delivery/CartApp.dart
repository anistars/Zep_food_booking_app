import 'package:authapp/Screens/OrderHistory/HistoryPage.dart';
import 'package:authapp/Screens/UserProfile/profileScreen.dart';
import 'package:authapp/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:authapp/Screens/Delivery/screen/cartmodel.dart';
import 'package:authapp/Screens/Delivery/screen/home.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class CartApp extends StatefulWidget {
  final CartModel model;

  const CartApp({Key key, @required this.model}) : super(key: key);

  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
      model: widget.model,
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: currentIndex,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: (index) => setState(() {
                currentIndex = index;
              }),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Colors.red,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.history),
                  title: Text('History'),
                  activeColor: Colors.purpleAccent,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text(
                    'User',
                  ),
                  activeColor: Colors.pink,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            body: (currentIndex == 0)
                ? HomePage()
                : (currentIndex == 1)
                    ? HistoryPage()
                    : ProfileScreen(),
          ),
        ),
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
