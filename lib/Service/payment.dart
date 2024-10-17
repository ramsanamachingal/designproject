import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class PaymentController with ChangeNotifier {
  List<UpiApp>? apps;
  Future<UpiResponse>? transaction;

  // getResponse(UpiResponse? upiResponse) {
  //   upiResponse = upiResponse;
  //   notifyListeners();
  // }

  UpiIndia _upiIndia = UpiIndia();
  Future<List<UpiApp>> initializeUpiIndia() async {
    return await _upiIndia
        .getAllUpiApps(mandatoryTransactionId: false)
        .then((value) {
      return apps = value;
    }).catchError((e) {
      return apps = [];
    });
  }

  Future<UpiResponse> initiateTransaction(context,
      {required UpiApp app,
      required String receiverUpiId,
      required String receiverName,
      required double amount}) async {
    print("object");

    final data = _upiIndia.startTransaction(
      app: app,
      receiverUpiId: receiverUpiId,
      receiverName: receiverName,
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: amount,
    );
    notifyListeners();
    return data;
  }


FirebaseFirestore fire = FirebaseFirestore.instance;
Future<void> paymentSample(
  String price,
  String status,
  String name,
  String userid,
  String size,
   String image
) async {
  // Generate an automatic document ID
  DocumentReference docRef = fire.collection("payment").doc(); 
  String id = docRef.id; // Retrieve the generated ID

  Map<String, dynamic> pay = {
    "id": id,
    "paid to": name,
    "price": price,
    "paymentStatus": status,
    "paid from": userid,
    "size":size,
    "image":image,
    "timestamp": FieldValue.serverTimestamp(), // Add this line
  };
  
  await docRef.set(pay); // Use the doc reference for storing data
}

  // Future updatePayment(id) async {
  //   fire.collection("payment").doc(id).update({"paymentStatus": true});
  // }
  
}
