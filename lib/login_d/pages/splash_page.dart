import 'package:flutter/material.dart';

import 'package:happy_wash/after_login.dart';

import 'package:happy_wash/login_d/pages/login_page.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/login_d/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoginStore>(context, listen: false)
        .isAlreadyAuthenticated()
        .then((result) {
      if (result) {
        // if (authProvider.userModel.number == '+919340133342') {
        //   Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(builder: (_) => AdminScreen()),
        //       (Route<dynamic> route) => false);
        // } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => AfterLogin()),
            (Route<dynamic> route) => false);
        // }
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
    );
  }
}
