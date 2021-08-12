import 'package:adaptive_design/create_account.dart';
import 'package:adaptive_design/login_view.dart';
import 'package:adaptive_design/ui/orientation_layout.dart';
import 'package:adaptive_design/ui/screen_type_layout.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginMobilePortrait(),
        landscape: LoginMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: LoginTabletPortrait(),
        landscape: LoginTabletLandscape(),
      ),
      desktop: OrientationLayout(
        portrait: LoginDesktopPortrait(),
        landscape: LoginDesktopLandscape(),
      ),
    );
  }
}

class LoginMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildContainer(context),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Container(color: Colors.white, child: LoginView()),
    );
  }
}

class LoginMobileLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Mobile LS'),
    );
  }
}

class LoginTabletPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildContainer(context));
  }

  Container buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: LoginView()),
    );
  }
}

class LoginTabletLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildContainer(context));
  }

  Container buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 3,
          color: Colors.white,
          child: LoginView()),
    );
  }
}

class LoginDesktopPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildContainer(context));
  }

  Container buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.white,
          child: LoginView()),
    );
  }
}

class LoginDesktopLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildContainer(context));
  }

  Container buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: LoginView()),
    );
  }
}
