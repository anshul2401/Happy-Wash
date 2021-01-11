import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const ADDRESS = 'address';
  static const NUMBER = 'number';
  static const LANDMARK = 'landmark';
  static const PIN = 'pin';
  // static const NAME = 'name';

  String _name;
  String _email;
  String _id;
  String _address;
  String _number;
  String _landmark;
  String _pin;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get address => _address;
  String get number => _number;
  String get landmark => _landmark;
  String get pin => _pin;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _address = snapshot.data[ADDRESS];
    _number = snapshot.data[NUMBER];
    _landmark = snapshot.data[LANDMARK];
    _pin = snapshot.data[PIN];
  }
}
