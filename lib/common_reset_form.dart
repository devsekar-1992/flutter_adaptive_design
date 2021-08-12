import 'package:adaptive_design/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// ignore: must_be_immutable
class CommonResetForm extends StatefulWidget {
  CommonResetForm();
  @override
  _CommonResetFormState createState() => _CommonResetFormState();
}

class _CommonResetFormState extends State<CommonResetForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return buildColumn(context);
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AdaptiveTextField(
                              onValidate: (value) {
                                if (value == '') {
                                  return 'Email Address Should be Mandatory';
                                }
                              },
                              changeFn: (value) {
                                setState(() {
                                  EmailValidator.validate(value);
                                });
                              },
                              fieldLabel: 'Email Address',
                              isObsureText: false),
                        ],
                      )),
                )
              ],
            )),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
            padding: EdgeInsets.all(30.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                onPressed: () {
                  this._formKey.currentState!.validate();
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))),
      ],
    );
  }
}
