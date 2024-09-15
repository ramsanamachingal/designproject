import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Shop{
  FirebaseFirestore fire=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  Future <void>shopView(String str,dynamic phone,String str1 ,String imageurl,dynamic email,dynamic password,String uid)async{
Map<String,dynamic>shops={
  "Shop name:":str,
      "shop address":str1,
      "phone number":phone,
      "Email":email,
      "Password":password,
      "image":imageurl,
      "id":uid
};
 try {
      await fire.collection("shop").doc(uid).set(shops);
      print("Shop added successfully!");
    } catch (e) {
      print("Error adding shop: $e");
    }
  }
  deleteshop(docid){
    fire.collection("shop").doc(docid).delete();
  }
}