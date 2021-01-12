import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/auth.dart';
import 'package:happy_wash/details.dart';
import 'package:happy_wash/loding.dart';
import 'package:happy_wash/login.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/order_provider.dart';
import 'package:happy_wash/orders.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';
import 'package:happy_wash/screens/how_it_works.dart';
import 'package:happy_wash/screens/services.dart';
import 'package:happy_wash/user.dart';
import 'package:happy_wash/user_services.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';

class TakingUserDetails extends StatefulWidget {
  String address;
  String email;
  String name;
  String landmark;
  String amount;
  String date;
  String time;
  String carModel;
  String package;
  TakingUserDetails(this.address, this.email, this.name, this.landmark,
      this.amount, this.date, this.time, this.carModel, this.package);
  @override
  _TakingUserDetailsState createState() => _TakingUserDetailsState();
}

class _TakingUserDetailsState extends State<TakingUserDetails> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AfterLogin()));
    }

    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => YourBooking()));
    }
  }

  _TakingUserDetailsState();

  // final TextEditingController _nameController = new TextEditingController();

  // final TextEditingController _emailController = new TextEditingController();
  // final TextEditingController _addressController = new TextEditingController();
  // final TextEditingController _landmarkController = new TextEditingController();
  final _form = GlobalKey<FormState>();
  String pin;
  String address;
  String email;
  String name;
  String landmark;

  // @override
  // void initState() {
  //   _nameController.text = name;
  //   _emailController.text = email;
  //   _addressController.text = address;
  //   _landmarkController.text = landmark;
  //   return super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    final authProvider = Provider.of<LoginStore>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    pin = authProvider.userModel.pin;
    address = authProvider.userModel.address;
    email = authProvider.userModel.email;
    name = authProvider.userModel.name;
    landmark = authProvider.userModel.landmark;

    UserServices userServices = new UserServices();
    void saveInput() {
      final isValidate = _form.currentState.validate();
      if (!isValidate) {
        return null;
      }

      _form.currentState.save();

      bool rightpin = false;
      if (pin == '456010') {
        rightpin = true;
      }
      if (pin == '456001') {
        rightpin = true;
      }
      if (pin == '456006') {
        rightpin = true;
      }
      if (pin == '456664') {
        rightpin = true;
      }

      if (rightpin) {
        print(widget.package);
        var orderDetails = OrderItem(
          address: address,
          carModel: widget.carModel,
          date: widget.date,
          name: name,
          orderId: " ",
          phoneNum: authProvider.userModel.number,
          status: 'Pending',
          time: widget.time,
          userId: authProvider.userModel.id,
          landmark: landmark,
          package: widget.package,
        );
        userServices.updateUserData({
          "id": authProvider.userModel.id,
          "number": authProvider.userModel.number,
          "email": email,
          "address": address,
          "name": name,
          "landmark": landmark,
          "pin": pin
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsOfBooking(orderDetails, widget.amount, email)));
      } else {
        Fluttertoast.showToast(
          msg: "Sorry! We do not serve in your city.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 127, 219, 1),
        title: Text(
          'HappyWash',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        elevation: 5,
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: EdgeInsets.only(bottom: 10, top: 25),
              child: Text(
                'Personal Details',
                style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
                textAlign: TextAlign.center,
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
                autocorrect: false,
                onSaved: (newValue) {
                  name = newValue;
                },
                initialValue: name,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "This field is required";
                //   }

                //   return null;
                // },
                validator: (name) {
                  Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(name))
                    return 'Invalid username';
                  else
                    return null;
                },
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: const InputDecoration(labelText: "Email ID"),
                autocorrect: false,
                // controller: _emailController,
                onSaved: (newValue) {
                  email = newValue;
                },
                initialValue: email,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "This field is required";
                //   }
                //   return null;
                // },
                validator: (value) => EmailValidator.validate(value)
                    ? null
                    : "Invalid Email address",
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
                autocorrect: false,
                onSaved: (newValue) {
                  address = newValue;
                },
                initialValue: address,
                validator: (value) {
                  if (value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: const InputDecoration(labelText: "Landmark"),
                autocorrect: false,
                onSaved: (newValue) {
                  landmark = newValue;
                },
                initialValue: widget.landmark,
                validator: (value) {
                  if (value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
            ),
            new Container(
              child: new TextFormField(
                  decoration: const InputDecoration(labelText: "PIN Code"),
                  autocorrect: false,
                  // controller: _emailController,
                  onSaved: (newValue) {
                    pin = newValue;
                  },
                  // onChanged: (value) => {pin = value},
                  initialValue: pin,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field is required";
                      // } else if (pin != '456001' ||
                      //     pin != '456006' ||
                      //     pin != '456010' ||
                      //     pin != '456664') {
                      //   Fluttertoast.showToast(
                      //     msg: "Sorry! We do not serve in your city.",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //   );
                      //   return ' ';
                    }
                    return null;
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                saveInput();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 127, 219, 1),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Confirm Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Colors.white,
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Service History'),
          ),
        ],
        selectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
