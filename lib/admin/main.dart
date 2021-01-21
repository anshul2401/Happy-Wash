import 'package:flutter/material.dart';
import 'package:happy_wash/admin/cancelled_order.dart';
import 'package:happy_wash/admin/order_det.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/orders.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  DateTime pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String todayDate = formatter.format(DateTime.now()).toString();

    final order = Provider.of<List<OrderItem>>(context)
        .where((element) =>
            element.date == formatter.format(pickedDate).toString())
        .toList();

    final completeOrder =
        order.where((element) => element.status == 'Completed').toList();
    final pendingOrder =
        order.where((element) => element.status == 'Pending').toList();

    final authProvider = Provider.of<LoginStore>(context);

    void _presentDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime(2030))
          .then((value) {
        if (value == null) {
          return;
        }

        setState(() {
          pickedDate = value;
        });
      });
    }

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
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
            leading: PopupMenuButton(
                onSelected: (int selectedValue) => {
                      if (selectedValue == 0)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CancelledOrder()))
                        }
                      else if (selectedValue == 1)
                        {authProvider.signOut(context)}
                    },
                icon: Icon(
                  Icons.menu,
                  size: 35,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(child: Text('Cancelled'), value: 0),
                      PopupMenuItem(child: Text('Log Out'), value: 1),
                    ]),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Pick Date',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(0, 127, 219, 1),
                  ),
                  Text(
                    pickedDate == null
                        ? todayDate
                        : 'Showing Orders For: ${formatter.format(pickedDate)}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: pendingOrder.length != 0
                        ? ListView.builder(
                            itemCount: pendingOrder.length,
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
                                                OrderDet(pendingOrder[index])));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      title: Text(pendingOrder[index].time),
                                      subtitle:
                                          Text(pendingOrder[index].address),
                                      trailing: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: pendingOrder[index].status,
                                            style: TextStyle(
                                                color: pendingOrder[index]
                                                            .status ==
                                                        'Pending'
                                                    ? Colors.yellow[900]
                                                    : pendingOrder[index]
                                                                .status ==
                                                            'Cancel'
                                                        ? Colors.red
                                                        : Colors.green[900]))
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
                                  'No orders pending',
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
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Pick Date',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(0, 127, 219, 1),
                  ),
                  Text(
                    pickedDate == null
                        ? todayDate
                        : 'Showing Orders For: ${formatter.format(pickedDate)}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: completeOrder.length != 0
                        ? ListView.builder(
                            itemCount: completeOrder.length,
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
                                                completeOrder[index])));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      title: Text(completeOrder[index].time),
                                      subtitle:
                                          Text(completeOrder[index].address),
                                      trailing: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: completeOrder[index].status,
                                            style: TextStyle(
                                                color: completeOrder[index]
                                                            .status ==
                                                        'Pending'
                                                    ? Colors.yellow[900]
                                                    : completeOrder[index]
                                                                .status ==
                                                            'Cancel'
                                                        ? Colors.red
                                                        : Colors.green[900]))
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
                                  'No orders completed',
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
