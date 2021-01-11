import 'package:flutter/material.dart';
import 'package:happy_wash/order_service.dart';
import 'package:happy_wash/orders.dart';
import 'package:social_share/social_share.dart';

class OrderDet extends StatefulWidget {
  final OrderItem order;
  OrderDet(this.order);
  @override
  _OrderDetState createState() => _OrderDetState();
}

class _OrderDetState extends State<OrderDet> {
  OrderServices orderServices = new OrderServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 127, 219, 1),
          elevation: 5,
          title: Text(
            'HappyWash',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Detail:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'NAME: ' + widget.order.name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ADDRESS: ' + widget.order.address,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'LANDMARK: ' + widget.order.landmark,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'PHONE: ' + widget.order.phoneNum,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'DATE AND TIME: ' +
                    widget.order.date +
                    ' at ' +
                    widget.order.time,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'CAR MODEL: ' + widget.order.carModel,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        try {
                          orderServices.updateUserData({
                            "id": widget.order.orderId,
                            "userId": widget.order.userId,
                            'name': widget.order.name,
                            'address': widget.order.address,
                            'phoneNum': widget.order.phoneNum,
                            'carModel': widget.order.carModel,
                            'date': widget.order.date,
                            'time': widget.order.time,
                            'status': 'Completed',
                            'landmark': widget.order.landmark
                          });
                        } catch (e) {
                          print(e);
                        }
                      });
                    },
                    child: Text(
                      'Completed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      SocialShare.shareWhatsapp("Hello World");
                    },
                    child: Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
