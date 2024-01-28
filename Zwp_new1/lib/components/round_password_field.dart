import 'package:authapp/components/text_field_container.dart';
import 'package:authapp/constraints.dart';
import 'package:flutter/material.dart';

class RoundPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final Function validator;

  const RoundPasswordField(
      {Key key, this.onChanged, this.textEditingController, this.validator})
      : super(key: key);

  @override
  _RoundPasswordFieldState createState() => _RoundPasswordFieldState();
}

class _RoundPasswordFieldState extends State<RoundPasswordField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextContainerField(
      child: TextFormField(
        obscureText: isPassword,
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffix: InkWell(
            onTap: () {
              setState(() {
                isPassword = !isPassword;
              });
            },
            child: Icon(
              isPassword ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
