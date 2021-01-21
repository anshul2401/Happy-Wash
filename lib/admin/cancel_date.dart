import 'package:flutter/material.dart';
import 'package:happy_wash/order_provider.dart';
import 'package:happy_wash/orders.dart';
import 'package:provider/provider.dart';
import 'package:happy_wash/date_picker/date_picker_widget.dart';
import 'package:intl/intl.dart';

class CancelDateTime extends StatefulWidget {
  CancelDateTime();
  @override
  _CancelDateTimeState createState() => _CancelDateTimeState();
}

class _CancelDateTimeState extends State<CancelDateTime> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String _pickedTime;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<List<OrderItem>>(context)
        .where((element) =>
            element.date == formatter.format(_selectedDate).toString())
        .toList();
    // ignore: missing_return
    final orderProvider = Provider.of<OrderProvider>(context);

    Widget showButton(String time) {
      var taken = false;
      for (var i = 0; i < order.length; i++) {
        if (time == order[i].time) {
          taken = true;
        }
      }
      // int getTime(time) {
      //   if (time == '9 AM') {
      //     return 9;
      //   }
      //   if (time == '10:30 AM') {
      //     return 10;
      //   }
      //   if (time == '12 AM') {
      //     return 12;
      //   }
      //   if (time == '2 AM') {
      //     return 14;
      //   }
      //   if (time == '3:30 AM') {
      //     return 15;
      //   }
      //   if (time == '5 AM') {
      //     return 17;
      //   }
      // }

      // if (DateTime.now().hour + 1 > 5) {
      //   taken = true;
      // }

      if (_selectedDate == null || taken == true) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(5)),
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                time,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            padding: EdgeInsets.all(0),
          ),
        );
      }
      if (_pickedTime == null || _pickedTime != time) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(0, 127, 219, 1), width: 2),
                  borderRadius: BorderRadius.circular(5)),
              width: 80,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(0),
            ),
          ),
          onTap: () {
            setState(() {
              _pickedTime = time;
            });
          },
        );
      }
      if (_pickedTime == time)
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 127, 219, 1),
                  border: Border.all(
                      color: Color.fromRGBO(0, 127, 219, 1), width: 2),
                  borderRadius: BorderRadius.circular(5)),
              width: 80,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(0),
            ),
          ),
          onTap: () {
            setState(() {
              _pickedTime = time;
            });
          },
        );
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
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Cancel slot',
                    style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                          height: 130,
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: DatePicker(
                                  DateTime.now(),
                                  width: 60,
                                  height: 80,
                                  controller: _controller,
                                  initialSelectedDate: DateTime.now(),
                                  selectionColor:
                                      Color.fromRGBO(0, 127, 219, 1),
                                  selectedTextColor: Colors.white,
                                  onDateChange: (date) {
                                    // New date selected
                                    setState(() {
                                      _pickedTime = null;
                                      _selectedDate = date;
                                      // ignore: unused_local_variable
                                      final DateFormat formatter =
                                          DateFormat('dd-MM-yyyy');
                                      //  final String formatted = formatter.format(_selectedDate);
                                    });
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showButton('9 AM'),
                          showButton('10:30 AM'),
                          showButton('12 PM'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showButton('2 PM'),
                          showButton('3:30 PM'),
                          showButton('5 PM'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    orderProvider.setCarMod('');
                    orderProvider.setAddress('');
                    orderProvider
                        .setDate(formatter.format(_selectedDate).toString());
                    orderProvider.setTime(_pickedTime);
                    orderProvider.setPhoneNum('');
                    orderProvider.setUserID('');
                    orderProvider.setName('');
                    orderProvider.setStatus('NotAvailable');
                    orderProvider.setLandmark('');
                    orderProvider.setPackage('');
                    orderProvider.saveOrder();
                    setState(() {});
                    // Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _selectedDate == null || _pickedTime == null
                              ? Colors.grey
                              : Color.fromRGBO(0, 127, 219, 1),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Done',
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
        ],
      ),
    );
  }
}
