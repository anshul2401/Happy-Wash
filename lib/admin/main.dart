import 'package:flutter/material.dart';
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
    // DateTime pickedDate = DateTime.now();
    // final today = DateTime.now();

    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String todayDate = formatter.format(DateTime.now()).toString();
    // print(todayDate);
    // print(todayDate);

    final order = Provider.of<List<OrderItem>>(context)
        .where((element) =>
            element.date == formatter.format(pickedDate).toString())
        .toList();
    // print(formatter.format(pickedDate).toString());
    // print(order);
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
          actions: [
            GestureDetector(
              child: Icon(Icons.logout),
              onTap: () {
                authProvider.signOut(context);
              },
            ),
          ]),
      body: Column(
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
                            child: ListTile(
                              title: Text(order[index].time),
                              subtitle: Text(order[index].address),
                              trailing: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: 'Status: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: order[index].status,
                                    style: TextStyle(
                                        color: order[index].status == 'Pending'
                                            ? Colors.red[900]
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
                          'No Orders',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
