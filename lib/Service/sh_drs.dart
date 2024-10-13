import 'package:login/Admin/adDesign.dart';

class ShopDress {
  Future<void> shopDressview(
    String id,
    String imageUrl,
    String drsname,
    String price,
    String qty,
    String size,
  ) async {
    Map<String, dynamic> shpdrs = {
      "id": id,
      "image": imageUrl,
      "Dress name": drsname,
      "price":price,
      "quantity":qty,
      "size":size
    };
    await fire.collection("ShopDress").doc(id).collection('shdress').add(shpdrs);
  }
}
