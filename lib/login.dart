import 'package:flutter/material.dart';
import 'package:happy_wash/auth.dart';
import 'package:happy_wash/loding.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: auth.loading
              ? Loading()
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/logo4.png",
                        width: 160,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Happy Wash'),
                  SizedBox(height: 5),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: " Happy Wash",
                        style: TextStyle(color: Colors.blue.shade900)),
                  ], style: TextStyle(color: Colors.black))),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(2, 1),
                                blurRadius: 2)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: number,
                          decoration: InputDecoration(
                              icon:
                                  Icon(Icons.phone_android, color: Colors.grey),
                              border: InputBorder.none,
                              hintText: "+91 123456789",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "After entering your phone number, click on verify to authenticate yourself! Then wait up to 20 seconds to get th OTP and procede",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      child: Text('Varify'),
                      onPressed: () {
                        auth.verifyPhoneNumber(context, number.text);
                      })
                ]),
        ),
      ),
    );
  }
}
