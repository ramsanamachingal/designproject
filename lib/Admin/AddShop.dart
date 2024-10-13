
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/Adhome.dart';

import 'package:login/Service/clsshop.dart';

Shop shop = Shop();

class AddShop extends StatefulWidget {
  const AddShop({super.key});

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  final Reference _fireStorage = FirebaseStorage.instance.ref().child('image');
  String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();
  final shopnamecontroller = TextEditingController();
  final shopaddresscontroller = TextEditingController();

  final shopphncontroller = TextEditingController();
  final shopimageController = TextEditingController();
  final shopemailController = TextEditingController();
  final shoppassswordController = TextEditingController();
  String? imageURL;
  File? selectedImage;
  Future<void> _pickedImageGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.pink,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 700,
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
                                borderSide:
                                    const BorderSide(color: Colors.pink)),
                            hintText: "Shop name",
                            hintStyle: GoogleFonts.pacifico(
                              color: Colors.black.withOpacity(0.5),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                                          : const AssetImage(
                                                  "assets/d3d8df2b75dbf5b93c053bbd85b7882e (1).jpg")
                                              as ImageProvider
                                              ),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              height: 100,
                              width: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, left: 50),
                                child: IconButton(
                                    onPressed: _pickedImageGallery,
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                    )),
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
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: const BorderSide(
                                                color: Colors.pink)),
                                        hintText: "address",
                                        hintStyle: GoogleFonts.pacifico(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: shopphncontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: const BorderSide(
                                                color: Colors.pink)),
                                        hintText: "Phone ",
                                        hintStyle: GoogleFonts.pacifico(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: shopemailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.pink)),
                          hintText: "Email ",
                          hintStyle: GoogleFonts.pacifico(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: shoppassswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.pink)),
                          hintText: "Password ",
                          hintStyle: GoogleFonts.pacifico(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.white))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.pink)),
                        onPressed: () async {
  // Ensure email and password are trimmed and validated
  String email = shopemailController.text.trim();
  String password = shoppassswordController.text;

  if (selectedImage != null) {
    Reference referenceImageToUpload = _fireStorage.child(uniqueImageName);
    try {
      await referenceImageToUpload.putFile(selectedImage!);
      imageURL = await referenceImageToUpload.getDownloadURL();
      print("Image uploaded successfully: $imageURL");
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  // Validate email format
  if (email.isEmpty || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
    print("Invalid email format");
    return;
  }

  try {
    UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, // Use trimmed email
      password: password
    );
    
    String id = credential.user!.uid;
    await shop.shopView(
      shopnamecontroller.text,
      shopphncontroller.text,
      shopaddresscontroller.text,
      imageURL.toString(),
      email, // Use trimmed email
      password,
      id
    );
    print("Shop added successfully!");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Adhome()));
  } catch (e) {
    print("Error adding shop: $e");
  }
},


              
                child: Text(
                  "Done",
                  style: GoogleFonts.pacifico(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
