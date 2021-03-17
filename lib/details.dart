import 'package:flutter/material.dart';
import 'package:happy_wash/booking_failed.dart';
import 'package:happy_wash/confirm_booking.dart';

import 'package:happy_wash/orders.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class DetailsOfBooking extends StatefulWidget {
  OrderItem orderDetails;
  String amount;
  String email;
  DetailsOfBooking(this.orderDetails, this.amount, this.email);

  @override
  _DetailsOfBookingState createState() => _DetailsOfBookingState();
}

class _DetailsOfBookingState extends State<DetailsOfBooking> {
  Razorpay razorpay;
  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccessful);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void paymentError(PaymentFailureResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BookingFailed()));
  }

  void paymentSuccessful(PaymentSuccessResponse response) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return BookingConfirmed(widget.orderDetails, 'Paid');
    }));
  }

  void externalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName);
  }

  void openCheckout() {
    var options = {
      "key": "rzp_live_fo8bJpJWV6ahPH",
      "amount": num.parse(widget.amount) * 100,
      "name": "Happy Wash",
      "description": "A step Away",
      "prefill": {
        "contact": widget.orderDetails.phoneNum,
        "email": widget.email,
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 127, 219, 1),
        title: Text(
          'HappyWash',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 5,
        // leading: Image(
        //   image: AssetImage('images/logo4.png'),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Booking Details',
                style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Table(
              children: [
                TableRow(children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.orderDetails.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [Text(''), Text('')]),
                TableRow(children: [
                  Text(
                    'Address:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.orderDetails.address != null
                        ? widget.orderDetails.address
                        : " ",
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [Text(''), Text('')]),
                TableRow(children: [
                  Text(
                    'Moblie Number:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.orderDetails.phoneNum != null
                        ? widget.orderDetails.phoneNum
                        : " ",
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [Text(''), Text('')]),
                TableRow(children: [
                  Text(
                    'Date and Time:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.orderDetails.date +
                        ' at ' +
                        widget.orderDetails.time,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [Text(''), Text('')]),
                TableRow(children: [
                  Text(
                    'Total Amount:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'INR ' + widget.amount,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ])
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return BookingConfirmed(widget.orderDetails, 'Not Paid');
                }));
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
                        Text('Cash on Delivery',
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
            GestureDetector(
              onTap: () {
                openCheckout();
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
                        Text('Procced To Pay',
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
    );
  }
}
