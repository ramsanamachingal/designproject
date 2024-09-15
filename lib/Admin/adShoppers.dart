import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/AddShop.dart';
import 'package:login/Admin/Adhome.dart';
import 'package:login/Service/clsshop.dart';
FirebaseFirestore fire=FirebaseFirestore.instance;
Shop shop=Shop();
class AdminShoppers extends StatefulWidget {
  const AdminShoppers({super.key});

  @override
  State<AdminShoppers> createState() => _AdminShoppersState();
}

class _AdminShoppersState extends State<AdminShoppers> {
  final shopnameController=TextEditingController();
  final shopaddressController=TextEditingController();
  final shopphoneController=TextEditingController();
  final shopimageController=TextEditingController();
  String image = '';
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
     
      body: Column(
        children: [
        
          StreamBuilder(stream: fire.collection("shop").snapshots(),
          builder: (context, snapshot) {
             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No user profiles found'));
          }
          final allshop=snapshot.data!.docs;
           return Expanded(
              child: ListView.builder(
                  itemCount: allshop.length,
                  itemBuilder: (context, index) {
                    final oneshop=allshop[index].data() as Map<String,dynamic>;
                    final shopid=allshop[index].id;
                    final String imageURL=oneshop['image'] ??'';
                    return Container(
                      height: 270,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.pink)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              oneshop['Shop name:'].toString(),
                              style: GoogleFonts.pacifico(
                                  color: Colors.pink, fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                   CircleAvatar(
                                    backgroundImage: imageURL ==''
                                   ? AssetImage(
                                        "assets/49595cfbc79f547e6dfa611aad355745.jpg")
                                        as ImageProvider:
                                        NetworkImage(imageURL),
                                    radius: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          oneshop['shop address'].toString(),
                                          style: GoogleFonts.pacifico(
                                              color: Colors.pink),
                                        ),
                                        Text(
                                          oneshop['phone number'].toString(),
                                          style: GoogleFonts.pacifico(
                                              color: Colors.pink),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                             Text(
                                          oneshop['Email'].toString(),
                                          style: GoogleFonts.pacifico(
                                              color: Colors.pink),
                                        ),
                                         Text(
                                          oneshop['Password'].toString(),
                                          style: GoogleFonts.pacifico(
                                              color: Colors.pink),
                                        ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdminShoppers()));
                                    },
                                    child: Text(
                                      "Edit",
                                      style: GoogleFonts.pacifico(
                                          color: Colors.white),
                                    )),
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
                                     shop.deleteshop(shopid);
                                    },
                                    child: Text(
                                      "Delete",
                                      style: GoogleFonts.pacifico(
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );


          },
           
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddShop()));
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.pink,
          size: 35,
        ),
      ),
    );
  }
}
