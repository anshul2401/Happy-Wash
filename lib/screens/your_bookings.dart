// import 'package:flutter/material.dart';
// import 'package:happy_wash/order_provider.dart';
// import 'package:happy_wash/order_service.dart';
// import 'package:happy_wash/orders.dart';
// import 'package:provider/provider.dart';

// class YourBooking extends StatefulWidget {
//   @override
//   _YourBookingState createState() => _YourBookingState();
// }

// class _YourBookingState extends State<YourBooking> {
//   // final List<OrderItem> yourOrder = Orders().orderss;

//   @override
//   Widget build(BuildContext context) {
//     final order = Provider.of<List<OrderItem>>(context);

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromRGBO(0, 127, 219, 1),
//           title: Text('HAPPY WASH'),
//           leading: Image(
//             image: AssetImage('images/logo4.png'),
//           ),
//         ),
//         body: ListView.builder(
//             itemCount: order.length,
//             itemBuilder: (_, index) {
//               return ListTile(
//                 title: Text(order[index].name),
//               );
//             }));
//   }
// }
