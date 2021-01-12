import 'dart:core';

import 'package:flutter/material.dart';

class OrderItem {
  // final String id;
  final String orderId;
  final String userId;
  final String name;
  final String address;
  final String phoneNum;
  final String carModel;
  final String date;
  final String time;
  final String status;
  final String landmark;
  final String package;

  OrderItem({
    // @required this.id,

    @required this.orderId,
    @required this.userId,
    @required this.name,
    @required this.address,
    @required this.phoneNum,
    @required this.carModel,
    @required this.date,
    @required this.time,
    @required this.status,
    @required this.landmark,
    @required this.package,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "id": orderId,
      "name": name,
      "address": address,
      "phoneNum": phoneNum,
      "carModel": carModel,
      "date": date,
      "time": time,
      "status": status,
      "landmark": landmark,
      "package": package
    };
  }

  OrderItem.fromFirestore(Map<String, dynamic> firestore)
      : orderId = firestore['id'],
        userId = firestore['userId'],
        name = firestore['name'],
        address = firestore['address'],
        phoneNum = firestore['phoneNum'],
        carModel = firestore['carModel'],
        date = firestore['date'],
        time = firestore['time'],
        status = firestore['status'],
        landmark = firestore['landmark'],
        package = firestore['package'];
}
