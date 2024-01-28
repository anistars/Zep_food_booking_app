import 'package:authapp/Screens/CashPage/CashPage.dart';
import 'package:authapp/Screens/Delivery/CartApp.dart';

import 'package:authapp/Screens/Delivery/screen/PaymentScreen.dart';
import 'package:authapp/Screens/Delivery/screen/cartpage.dart';
import 'package:authapp/Screens/ForgotPassword/forgotPassword.dart';
import 'package:authapp/Screens/Login/login_screen.dart';
import 'package:authapp/Screens/OrderHistory/OrderDetails.dart';
import 'package:authapp/Screens/SignUp/signupscreen.dart';
import 'package:authapp/Screens/UserProfile/editProfile.dart';
import 'package:authapp/Screens/Welcome/welcome_screen.dart';
import 'package:authapp/Screens/checkput_page/Checkout_Page.dart';
import 'package:flutter/material.dart';
import 'Screens/ChangePassword/forget_pass.dart';
import 'Screens/SignUp_OTP/otp_screen.dart';
import 'Screens/otp/otp_screen.dart';

class ScreenArguments {
  final dynamic first_arg;
  final dynamic second_arg;

  ScreenArguments(this.first_arg, this.second_arg);
}

class Mobile {
  final dynamic mobileno, otp;
  Mobile(this.mobileno, this.otp);
}

class SignUp {
  final dynamic mobileno;
  final firstName;
  final lastName;
  final email;
  final password;
  final otp;
  SignUp(this.firstName, this.lastName, this.mobileno, this.email,
      this.password, this.otp);
}

class ThreeScreenArguments {
  final dynamic first_arg;
  final dynamic second_arg;
  final dynamic three_arg;

  ThreeScreenArguments(this.first_arg, this.second_arg, this.three_arg);
}

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "/signup":
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case "/signup_otp":
        SignUp arguments = args;
        return MaterialPageRoute(
            builder: (_) => SignupOtpScreen(
                firstName: arguments.firstName,
                lastName: arguments.lastName,
                mobileno: arguments.mobileno,
                email: arguments.email,
                password: arguments.password,
                otp: arguments.otp));
      case "/forgot_password":
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case "/home_screen":
        return MaterialPageRoute(builder: (_) => CartApp(model: args));
      case "/cart":
        return MaterialPageRoute(builder: (_) => CartPage());
      case "/otp":
        Mobile arguments = args;
        return MaterialPageRoute(
            builder: (_) =>
                OtpScreen(mobileno: arguments.mobileno, otp: arguments.otp));
      case "/changePassword":
        Mobile arguments = args;
        return MaterialPageRoute(
            builder: (_) => ChangePassword(mobileno: arguments.mobileno));
      case "/CheckOutPage":
        ScreenArguments arguments = args;
        return MaterialPageRoute(
            builder: (_) => CheckOutPage(
                amount: arguments.first_arg, orderCart: arguments.second_arg));
      case "/payment_screen":
        ScreenArguments arguments = args;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(
                amount: arguments.first_arg, orderCart: arguments.second_arg));

      case "/cash_page":
        ThreeScreenArguments arguments = args;
        return MaterialPageRoute(
            builder: (_) => CashPage(
                amount: arguments.first_arg,
                orderCart: arguments.second_arg,
                address: arguments.three_arg));

      case "/order_history":
        ScreenArguments arguments = args;
        return MaterialPageRoute(
            builder: (_) =>
                OrderDetails(arguments.first_arg, arguments.second_arg));
      case "/edit_profile":
        return MaterialPageRoute(
            builder: (_) => EditProfilePage(
                  user: args,
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
