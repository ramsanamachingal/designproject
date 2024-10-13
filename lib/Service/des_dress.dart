import 'package:flutter/material.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/designer/Postupload.dart';

class DesignerDress{
  Future<void>dressView(String imageUrl,String name,String price,String qty,List<String> size,String id,context)async{
    Map<String,dynamic>dsgnrdres={
      "Dress name":name,
      "image":imageUrl,
      "price":price,
      "quantity":qty,
      "size":size,
      "id":id
    } ;
    await fire.collection("DesignerDress").doc(id).collection('dress').add(dsgnrdres);
  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostUpload()));
    
    // sizeView()async{
    //   CollectionReference store=FirebaseFirestore.instance.collection("size");
    //   List <Map<String,dynamic>>sizes=[
    //     {
    //       "XS":"XS",
    //       "S":"S",
    //       "M":"M",
    //       "L":"L",
    //       "XL":"XL",
    //       "XXL":"XXL",
    //     }
    //   ];
    //   for(var value in sizes){
    //     await store.add(
    //     value
    //   );
    //   }
    
    // }

  }
}
// class Sizedrs{
// // String XS;
// // String S;
// // String M;
// // String L;
// // String XL;
// // String XXL;


// }