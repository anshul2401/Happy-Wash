import 'package:flutter/material.dart';

import 'package:happy_wash/orders.dart';
import 'package:happy_wash/user_services.dart';

class UserProvider with ChangeNotifier {
  final userService = UserServices();
  // ignore: unused_field

  String _userId;
  String _name;
  String _address;
  String _phoneNum;
  String _pin;
  String _landmark;
  String _email;

  String get userId => _userId;
  String get name => _name;
  String get address => _address;
  String get phoneNum => _phoneNum;
  String get pin => _pin;

  String get landmark => _landmark;
  String get email => _email;

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

  setPin(String value) {
    _pin = value;
    notifyListeners();
  }

  setLandmark(String value) {
    _landmark = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  saveOrder() {
    // var newOrder = UserItem(
    //   orderId: uuid.v4(),
    //   userId: _userId,
    //   name: _name,
    //   address: _address,
    //   phoneNum: _phoneNum,
    //   carModel: _carModel,
    //   date: _date,
    //   time: _time,
    //   status: _status,
    //   landmark: _landmark,
    //   package: _package,
    // );
    // orderService.saveOrder(newOrder);
    userService.createUser({
      "id": _userId,
      "number": _phoneNum,
      "email": _email,
      "address": _address,
      "name": _name,
      "landmark": _landmark,
      "pin": _pin,
    });
  }
}
