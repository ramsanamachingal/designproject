import 'package:login/Admin/adDesign.dart';

class DesignerDress{
  Future<void>dressView(String imageUrl,String name,String price,String qty,)async{
    Map<String,dynamic>dsgnrdres={
      "Dress name":name,
      "image":imageUrl,
      "price":price,
      "quantity":qty
    } ;
    await fire.collection("DesignerDress").add(dsgnrdres);

  }
}