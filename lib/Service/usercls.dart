import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserClass {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fire = FirebaseFirestore.instance;
  Future<void> userSample(
    String id,
    String name,
    String address,
    String phone,
    String email,
   
    String imageUrl,
   
  ) async {
    Map<String, dynamic> user = {
      "id": id,
      "user name": name,
      "address": address,
      "phone no": phone,
      "email": email,
     
      "image": imageUrl,
     
    };
    await fire.collection("user").doc(id).set(user);
  }
}
