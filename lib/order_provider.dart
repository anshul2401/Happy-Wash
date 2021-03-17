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
  String _paymentStatus;
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
  String get paymentStatus => _paymentStatus;

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

  setPaymentStatus(String value) {
    _paymentStatus = value;
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
      paymentStatus: _paymentStatus,
    );
    orderService.saveOrder(newOrder);
  }
}
