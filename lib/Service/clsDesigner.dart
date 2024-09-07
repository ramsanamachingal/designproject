import 'package:cloud_firestore/cloud_firestore.dart';

class Designer{
  FirebaseFirestore fire=FirebaseFirestore.instance;
  Future designersView(String str,dynamic phone,String str1,dynamic imageUrl )async{

    Map<String,dynamic>designer={
      
      "Designer name:":str,
      "Shop name":str1,
      "phone number":phone,
      "image":imageUrl
    };
    await fire.collection("Designer").add(designer);
  }
  deleteDesigner(docid){
    fire.collection("Designer").doc(docid).delete();
  }
  updateDesigner(docid){
    fire.collection("Designer").doc(docid).update({

    });
  }
}