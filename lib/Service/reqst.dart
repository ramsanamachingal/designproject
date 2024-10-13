import 'package:login/Admin/adDesign.dart';

class RequestJob{
  Future<void>requestView(String id,String imageUrl,String send)async{
    Map<String,dynamic>rqstjob={
      "id":id,
      "image":imageUrl,
      "send":send
    };
    fire.collection("Request").add(rqstjob);
  }
}