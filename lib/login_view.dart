import 'package:adaptive_design/create_account.dart';
import 'package:adaptive_design/reset_password.dart';
import 'package:adaptive_design/ui/widgets/password_field.dart';
import 'package:adaptive_design/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isHidden = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 10),
            color: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'images/appui_logo.webp',
                height: 50,
                width: 50,
              ),
            )),
        SizedBox(
          height: 35,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey,\nLogin Now.',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('If you are new /',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          print('Create A New Acc');
                          createNewNavi(context);
                        },
                        child: Text(
                          'Create New',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AdaptiveTextField(
                            onValidate: (value) {
                              if (value == '') {
                                return 'Email Address should be mandatory';
                              }
                            },
                            changeFn: (value) {},
                            fieldLabel: 'Email Address',
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Forgot Password? /',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                            TextButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  resetPasswordNavi(context);
                                },
                                child: Text(
                                  'Reset Here',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))
                          ],
                        ),
                      ],
                    ))
              ],
            )),
          ),
        ),
        Container(
            padding: EdgeInsets.all(30.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromRGBO(139, 0, 0, 1)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                onPressed: () {
                  this._formKey.currentState!.validate();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))),
      ],
    );
  }

  void createNewNavi(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Create Account',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: CreateAccount());
    }));
  }

  void resetPasswordNavi(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Reset Password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ResetPassword());
    }));
  }
}
