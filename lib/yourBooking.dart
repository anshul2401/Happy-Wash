import 'package:flutter/material.dart';

import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/order_service.dart';

import 'package:happy_wash/orders.dart';
import 'package:happy_wash/screens/how_it_works.dart';

import 'package:provider/provider.dart';

import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';

class YourBooking extends StatefulWidget {
  @override
  _YourBookingState createState() => _YourBookingState();
}

class _YourBookingState extends State<YourBooking> {
  OrderServices orderServices = new OrderServices();
  void cancelOrder(OrderItem order, BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        setState(
          () {
            try {
              orderServices.updateUserData({
                "id": order.orderId,
                "userId": order.userId,
                'name': order.name,
                'address': order.address,
                'phoneNum': order.phoneNum,
                'carModel': order.carModel,
                'date': order.date,
                'time': order.time,
                'status': 'Cancel',
                'landmark': order.landmark
              });
              Navigator.of(context).pop();
              // set up the button
              Widget okButton = FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                content: Text("If paid, please call at 8989000910 for refund."),
                actions: [
                  okButton,
                ],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            } catch (e) {
              print(e);
            }
          },
        );
      },
    );
    Widget continueButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Are you sure you want to cancel the order?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    void _onItemTapped(int index) {
      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AfterLogin()));
      }
      if (index == 1) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    }

    final authProvider = Provider.of<LoginStore>(context);

    final user = Provider.of<LoginStore>(context);

    final order = Provider.of<List<OrderItem>>(context)
        .where((element) => element.userId == user.firebaseUser.uid)
        .toList();

    final completeOrder =
        order.where((element) => element.status == 'Completed').toList();
    final pendingOrder =
        order.where((element) => element.status == 'Pending').toList();
    final cancelledOrder = order
        .where((element) =>
            element.status == 'Cancel' || element.status == 'Refunded')
        .toList();

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                  Tab(
                    text: 'Cancelled',
                  ),
                ],
              ),
              backgroundColor: Color.fromRGBO(0, 127, 219, 1),
              elevation: 5,
              leading: PopupMenuButton(
                  onSelected: (int selectedValue) => {
                        if (selectedValue == 0)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HowItWorks()))
                          }
                        else if (selectedValue == 1)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gallery()))
                          }
                        else if (selectedValue == 2)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About()))
                          }
                        else if (selectedValue == 3)
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Faq()))
                          }
                        else if (selectedValue == 4)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactUs()))
                          }
                        else if (selectedValue == 7)
                          {
                            authProvider.signOut(context),
                          }
                      },
                  icon: Icon(
                    Icons.menu,
                    size: 35,
                  ),
                  itemBuilder: (_) => [
                        PopupMenuItem(child: Text('How it works?'), value: 0),
                        PopupMenuItem(child: Text('Gallery'), value: 1),
                        PopupMenuItem(child: Text('About'), value: 2),
                        PopupMenuItem(child: Text('FAQ\'s'), value: 3),
                        PopupMenuItem(child: Text('Contact Us'), value: 4),
                        PopupMenuItem(child: Text('Log Out'), value: 7),
                      ]),
              title: Text(
                'HappyWash',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    size: 35,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ));
                  },
                ),
              ]),
          body: TabBarView(children: [
            pendingOrder.length != 0
                ? ListView.builder(
                    itemCount: pendingOrder.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: Card(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ListTile(
                            title: Text('Booked On'),
                            subtitle: Text(pendingOrder[index].date +
                                ' At ' +
                                pendingOrder[index].time),
                            trailing: pendingOrder[index].status == 'Pending'
                                ? FlatButton(
                                    onPressed: () {
                                      cancelOrder(pendingOrder[index], context);
                                    },
                                    child: Text('Cancel'),
                                    color: Colors.red[900],
                                    textColor: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                    ),
                                  )
                                : Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: pendingOrder[index].status,
                                          style: TextStyle(
                                            color: pendingOrder[index].status ==
                                                    'Cancel'
                                                ? Colors.red[900]
                                                : Colors.green[900],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/nor_service3.png'),
                        Text(
                          'Listen to your Car.',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Book a Wash Now!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
            completeOrder.length != 0
                ? ListView.builder(
                    itemCount: completeOrder.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: Card(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ListTile(
                            title: Text('Booked On'),
                            subtitle: Text(completeOrder[index].date +
                                ' At ' +
                                completeOrder[index].time),
                            trailing: completeOrder[index].status == 'Pending'
                                ? FlatButton(
                                    onPressed: () {
                                      cancelOrder(
                                          completeOrder[index], context);
                                    },
                                    child: Text('Cancel'),
                                    color: Colors.red[900],
                                    textColor: Colors.white,
                                  )
                                : Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: completeOrder[index].status,
                                          style: TextStyle(
                                            color:
                                                completeOrder[index].status ==
                                                        'Cancel'
                                                    ? Colors.red[900]
                                                    : Colors.green[900],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/nor_service3.png'),
                        Text(
                          'Listen to your Car.',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Book a Wash Now!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
            cancelledOrder.length != 0
                ? ListView.builder(
                    itemCount: cancelledOrder.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: Card(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ListTile(
                            title: Text('Booked On'),
                            subtitle: Text(cancelledOrder[index].date +
                                ' At ' +
                                cancelledOrder[index].time),
                            trailing: cancelledOrder[index].status == 'Pending'
                                ? FlatButton(
                                    onPressed: () {
                                      cancelOrder(
                                          cancelledOrder[index], context);
                                    },
                                    child: Text('Cancel'),
                                    color: Colors.red[900],
                                    textColor: Colors.white,
                                  )
                                : Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: cancelledOrder[index].status,
                                          style: TextStyle(
                                            color:
                                                cancelledOrder[index].status ==
                                                        'Cancel'
                                                    ? Colors.red[900]
                                                    : Colors.green[900],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Text(
                      'No order has been canelled yet.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 35,
            backgroundColor: Colors.white,
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
            currentIndex: 2,
            selectedItemColor: Color.fromRGBO(0, 127, 219, 1),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
