import 'package:cloud_firestore/cloud_firestore.dart';

class Shop{
  FirebaseFirestore fire=FirebaseFirestore.instance;
  Future shopView(String str,dynamic phone,String str1 ,dynamic imageurl)async{
Map<String,dynamic>shops={
  "Shop name:":str,
      "shop address":str1,
      "phone number":phone,
      "image":imageurl
};
await fire.collection("shop").add(shops);
  }
  deleteshop(docid){
    fire.collection("shop").doc(docid).delete();
  }
}