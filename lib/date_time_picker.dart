import 'package:flutter/material.dart';
import 'package:happy_wash/date_picker/date_picker_widget.dart';
import 'package:intl/intl.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  DatePickerController _controller = DatePickerController();

  // ignore: unused_field
  DateTime _selectedValue = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     floatingActionButton: FloatingActionButton(
    //       child: Icon(Icons.replay),
    //       onPressed: () {
    //         _controller.animateToSelection();
    //       },
    //     ),
    //     appBar: AppBar(
    //       title: Text(widget.title),
    //     ),
    //     body: Container(
    return Container(
        height: 200,
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
                selectionColor: Color.fromRGBO(0, 127, 219, 1),
                selectedTextColor: Colors.white,
                // inactiveDates: [
                //   DateTime.now().add(Duration(days: 3)),
                //   DateTime.now().add(Duration(days: 4)),
                //   DateTime.now().add(Duration(days: 7))
                // ],
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                    // ignore: unused_local_variable
                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    //  final String formatted = formatter.format(_selectedValue);
                  });
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(20),
            // ),
            // // Text("You Selected:"),
            // // Padding(
            // //   padding: EdgeInsets.all(10),
            // // ),
            // // Text(formatter.format(_selectedValue).toString()),
          ],
        ));
    // ));
  }
}
