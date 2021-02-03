import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:happy_wash/orders.dart';

class OrderServices {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  Future<void> saveOrder(OrderItem order) {
    print(order);
    return _firestore
        .collection('orders')
        .document(order.orderId)
        .setData(order.toMap());
  }

  // Future<List<OrderItem>> getUserOrders({String userId}) async => _firestore
  //         .collection('orders')
  //         .where("userId", isEqualTo: userId)
  //         .getDocuments()
  //         .then((result) {
  //       List<OrderItem> orders = [];
  //       for (DocumentSnapshot order in result.documents) {
  //         orders.add(OrderProvider.fromSnapshot(order));
  //       }
  //       return orders;
  //     });
  Stream<List<OrderItem>> getUserOrders() {
    return _firestore.collection('orders').snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => OrderItem.fromFirestore(document.data))
            .toList());
  }

  void updateUserData(Map<String, dynamic> values) {
    String id = values['id'];
    _firestore.collection(collection).document(id).updateData(values);
  }
}
