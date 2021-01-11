import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PickTime extends StatelessWidget {
  Widget showButton(String time) {
    return Container(
      width: 60,
      child: OutlineButton(
          splashColor: Color.fromRGBO(0, 127, 219, 1),
          child: Text(
            time,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          padding: EdgeInsets.all(0),
          onPressed: () {
            _pickedTime = time;
          },
          //callback when button is clicked
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 127, 219, 1), //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 2,
          )),
    );
  }

  String _pickedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showButton('9 AM'),
            showButton('10 AM'),
            showButton('11 AM'),
            showButton('12 PM'),
            showButton('1 PM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showButton('2 PM'),
            showButton('3 PM'),
            showButton('4 PM'),
            showButton('5 PM'),
            showButton('6 PM'),
          ],
        ),
        Text(_pickedTime == null ? 'No Time Chosen' : _pickedTime)
      ],
    );
  }
}
