import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore{
  FirebaseFirestore f=FirebaseFirestore.instance;
  Future saveData(String str,String age, String course)async{

    Map<String,dynamic>b={
      "name":str,
      "age":age,
      "course" : course
    };
    
await f.collection("username").add(b);
  }
  deleteUser(docid ){
    f.collection("username").doc(docid).delete();
  }
  update(docid,newname){
    f.collection("username").doc(docid).update({"name":newname});
  }
  
}