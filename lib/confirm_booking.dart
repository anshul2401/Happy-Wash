import 'package:flutter/material.dart';
import 'package:happy_wash/order_provider.dart';
import 'package:happy_wash/orders.dart';
import 'package:provider/provider.dart';
import 'after_login.dart';

// ignore: must_be_immutable
class BookingConfirmed extends StatefulWidget {
  OrderItem orderDetails;
  BookingConfirmed(this.orderDetails);

  @override
  _BookingConfirmedState createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 1),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AfterLogin()))
            });
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    orderProvider.setCarMod(widget.orderDetails.carModel);
    orderProvider.setAddress(widget.orderDetails.address);
    orderProvider.setDate(widget.orderDetails.date);
    orderProvider.setTime(widget.orderDetails.time);
    orderProvider.setPhoneNum(widget.orderDetails.phoneNum);
    orderProvider.setUserID(widget.orderDetails.userId);
    orderProvider.setName(widget.orderDetails.name);
    orderProvider.setStatus(widget.orderDetails.status);
    orderProvider.setLandmark(widget.orderDetails.landmark);
    orderProvider.setPackage(widget.orderDetails.package);
    orderProvider.saveOrder();
    Future<bool> _onBackPressed() {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AfterLogin()));
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.blue[300],
              size: 150.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "BOOKING CONFIRMED",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.blue[300]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
