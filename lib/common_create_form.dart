import 'package:adaptive_design/ui/widgets/password_field.dart';
import 'package:adaptive_design/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// ignore: must_be_immutable
class CommonCreateForm extends StatefulWidget {
  String deviceType;
  CommonCreateForm({required this.deviceType});
  @override
  _CommonCreateFormState createState() => _CommonCreateFormState();
}

class _CommonCreateFormState extends State<CommonCreateForm> {
  bool _isHidden = true;
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
                                  return 'First Name should be mandatory';
                                }
                              },
                              changeFn: (value) {},
                              fieldLabel: 'First Name',
                              isObsureText: false),
                          SizedBox(
                            height: 5,
                          ),
                          AdaptiveTextField(
                              onValidate: (value) {
                                if (value == '') {
                                  return 'Last name should be mandatory';
                                }
                              },
                              changeFn: (value) {},
                              fieldLabel: 'Last Name',
                              isObsureText: false),
                          SizedBox(
                            height: 5,
                          ),
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
                          SizedBox(
                            height: 5,
                          ),
                          AdaptiveTextField(
                              onValidate: (value) {
                                if (value == '') {
                                  return 'Phone Number should be mandatory';
                                }
                              },
                              changeFn: (value) {},
                              fieldLabel: 'Phone Number',
                              isObsureText: false),
                          SizedBox(
                            height: 5,
                          ),
                          AdaptivePasswordField(
                            onValidate: (value) {
                              if (value == '') {
                                return 'Password should be filled';
                              }
                            },
                            isObsureText: _isHidden,
                            passwordSuffix: InkWell(
                              onTap: () {
                                print('On Tap');
                                setState(() {
                                  _isHidden = !_isHidden;
                                  print(_isHidden);
                                });
                              },
                              child: new Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            fieldLabel: 'Password',
                            changeFn: (value) {},
                          ),
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
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))),
      ],
    );
  }
}
