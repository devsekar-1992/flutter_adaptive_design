import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdaptiveTextField extends StatelessWidget {
  String fieldLabel;
  bool isObsureText;
  ValueChanged changeFn;
  FormFieldValidator onValidate;

  AdaptiveTextField(
      {required this.fieldLabel,
      required this.isObsureText,
      required this.changeFn,
      required this.onValidate});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: onValidate,
        onChanged: changeFn,
        obscureText: isObsureText,
        decoration: InputDecoration(
          hintText: fieldLabel,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}
