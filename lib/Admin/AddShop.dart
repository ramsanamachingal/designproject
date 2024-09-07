import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/adShoppers.dart';
import 'package:login/Service/clsshop.dart';
Shop shop=Shop();
FirebaseFirestore fire=FirebaseFirestore.instance;
class AddShop extends StatefulWidget {
  const AddShop({super.key});

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  final shopnamecontroller=TextEditingController();
  final shopaddresscontroller=TextEditingController();

final shopphncontroller=TextEditingController(); 
 final shopimageController=TextEditingController();
   String? imageURL;
   File? selectedImage;
 @override
  Widget build(BuildContext context) {
    Future<void> _pickedImageGallery() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.cancel,color: Colors.pink,size: 30,)),),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.pink)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Reena Thomas,",
                      //   style: GoogleFonts.pacifico(
                      //       color: Colors.pink, fontSize: 25),
                      // ),
                      TextFormField(
                        controller: shopnamecontroller,
                        decoration: InputDecoration(
                          
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.pink)),
                                hintText: "Shop name",
                                hintStyle: GoogleFonts.pacifico(
                            color: Colors.black.withOpacity(0.5),) ),
                                
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: selectedImage != null
                                    ? FileImage(selectedImage!)
                                    : const AssetImage("assets/image.png")
                                        as ImageProvider<Object>),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        height: 100,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60,left: 50),
                          child: IconButton(onPressed: (){
                            _pickedImageGallery();
                          }, icon: Icon(Icons.camera_alt_outlined,color: Colors.black,)),
                        ),
                      ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    //height: 40,
                                    width: 200,
                                    child: TextFormField(
                                      controller: shopaddresscontroller,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(7),
                                                                  borderSide: BorderSide(color: Colors.pink)),
                                                                  hintText: "address",
                                                                  hintStyle: GoogleFonts.pacifico(
                                                          color: Colors.black.withOpacity(0.5),fontSize:15), ),
                                                                  
                                                    ),
                                  ),
                                                  SizedBox(height: 10,),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: shopphncontroller,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(7),
                                                                  borderSide: BorderSide(color: Colors.pink)),
                                                                  hintText: "Phone ",
                                                                  hintStyle: GoogleFonts.pacifico(
                                                          color: Colors.black.withOpacity(0.5),fontSize:15), ),
                                                                  
                                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
             ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                side: const BorderSide(
                                                    color: Colors.white))),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.pink)),
                                    onPressed: () {
                                      shop.shopView(shopnamecontroller.text, shopphncontroller.text, shopaddresscontroller.text,imageURL);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdminShoppers()));
                                    },
                                    child: Text(
                                      "Done",
                                      style: GoogleFonts.pacifico(
                                          color: Colors.white),
                                    )),
          ],
        ),
      ),
    );
  }
}