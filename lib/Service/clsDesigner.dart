import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Designer{
  FirebaseFirestore fire=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  Future <void>designersView(String str,dynamic phone,String str1,String imageUrl,dynamic email,dynamic password,String userid )async{

     Map<String,dynamic>designer={
      
      "Designer name:":str,
      "Shop name":str1,
      "phone number":phone,
      "Email":email,
      "Password":password,
      "image":imageUrl,
      "id" : userid
    };
    await fire.collection("Designer").doc(userid).set(designer);
  }
  deleteDesigner(docid){
    fire.collection("Designer").doc(docid).delete();
  }
  updateDesigner(docid){
    fire.collection("Designer").doc(docid).update({

    });
  }
  
}