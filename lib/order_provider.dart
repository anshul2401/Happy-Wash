import 'package:flutter/material.dart';
import 'package:happy_wash/order_service.dart';
import 'package:happy_wash/orders.dart';
import 'package:uuid/uuid.dart';

class OrderProvider with ChangeNotifier {
  final orderService = OrderServices();
  // ignore: unused_field
  String _orderId;
  String _userId;
  String _name;
  String _address;
  String _phoneNum;
  String _carModel;
  String _date;
  String _time;
  String _status;
  String _landmark;
  String _package;
  var uuid = Uuid();

  String get userId => _userId;
  String get name => _name;
  String get address => _address;
  String get phoneNum => _phoneNum;
  String get carModel => _carModel;
  String get date => _date;
  String get time => _time;
  String get status => _status;
  String get landmark => _landmark;
  String get package => _package;

  setUserID(String value) {
    _userId = value;
  }

  setName(String value) {
    _name = value;
    notifyListeners();
  }

  setAddress(String value) {
    _address = value;
    notifyListeners();
  }

  setPhoneNum(String value) {
    _phoneNum = value;
    notifyListeners();
  }

  setCarMod(String value) {
    _carModel = value;
    notifyListeners();
  }

  setDate(String value) {
    _date = value;
    notifyListeners();
  }

  setTime(String value) {
    _time = value;
    notifyListeners();
  }

  setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  setLandmark(String value) {
    _landmark = value;
    notifyListeners();
  }

  setPackage(String value) {
    _package = value;
    notifyListeners();
  }

  saveOrder() {
    var newOrder = OrderItem(
      orderId: uuid.v4(),
      userId: _userId,
      name: _name,
      address: _address,
      phoneNum: _phoneNum,
      carModel: _carModel,
      date: _date,
      time: _time,
      status: _status,
      landmark: _landmark,
      package: _package,
    );
    orderService.saveOrder(newOrder);
  }

  // OrderProvider.fromSnapshot(DocumentSnapshot snapshot) {
  //   _orderId = snapshot.data["id"];
  //   _userId = snapshot.data['userId'];
  //   _name = snapshot.data['name'];
  //   _address = snapshot.data['address'];
  //   _phoneNum = snapshot.data['phoneNum'];
  //   _carModel = snapshot.data['carModel'];
  //   _date = snapshot.data['date'];
  //   _time = snapshot.data['time'];
  //   _status = snapshot.data['status'];
  // }
}
