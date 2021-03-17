import 'package:flutter/material.dart';
import 'package:happy_wash/admin/order_det.dart';
import 'package:happy_wash/order_service.dart';
import 'package:happy_wash/orders.dart';
import 'package:provider/provider.dart';

class CancelledOrder extends StatefulWidget {
  @override
  _CancelledOrderState createState() => _CancelledOrderState();
}

class _CancelledOrderState extends State<CancelledOrder> {
  OrderServices orderServices = new OrderServices();
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<List<OrderItem>>(context)
        .where((element) =>
            element.status == 'Cancel' && element.paymentStatus == 'Paid')
        .toList();
    final orderRefunded = Provider.of<List<OrderItem>>(context)
        .where((element) => element.status == 'Refunded')
        .toList();
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Non-Refunded',
                ),
                Tab(
                  text: 'Refunded',
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(0, 127, 219, 1),
            elevation: 5,
            title: Text(
              'HappyWash',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                    child: order.length != 0
                        ? ListView.builder(
                            itemCount: order.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderDet(order[index])));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(order[index].date +
                                              ' at ' +
                                              order[index].time),
                                          subtitle: Text(order[index].address),
                                          trailing: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Status: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                  text: order[index].status,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              try {
                                                orderServices.updateUserData({
                                                  "id": order[index].orderId,
                                                  "userId": order[index].userId,
                                                  'name': order[index].name,
                                                  'address':
                                                      order[index].address,
                                                  'phoneNum':
                                                      order[index].phoneNum,
                                                  'carModel':
                                                      order[index].carModel,
                                                  'date': order[index].date,
                                                  'time': order[index].time,
                                                  'status': 'Refunded',
                                                  'landmark':
                                                      order[index].landmark
                                                });
                                              } catch (e) {
                                                print(e);
                                              }
                                            });
                                          },
                                          child: Text('Refunded'),
                                          textColor: Colors.white,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No Orders cancelled',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: orderRefunded.length != 0
                        ? ListView.builder(
                            itemCount: orderRefunded.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDet(
                                                orderRefunded[index])));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      title: Text(orderRefunded[index].date +
                                          ' at ' +
                                          orderRefunded[index].time),
                                      subtitle:
                                          Text(orderRefunded[index].address),
                                      trailing: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: orderRefunded[index].status,
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ])),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No Orders to refund',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
