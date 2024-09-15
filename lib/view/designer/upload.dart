import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Service/des_dress.dart';
import 'package:login/view/designer/DesProfile.dart';
import 'package:login/view/designer/Postupload.dart';

DesignerDress drs = DesignerDress();

List<String> a = ["XS", "S", "M", "L", "XL", "XXL"];

class DesignerUpload extends StatefulWidget {
  const DesignerUpload({super.key});

  @override
  State<DesignerUpload> createState() => _DesignerUploadState();
}

class _DesignerUploadState extends State<DesignerUpload> {
  String dropvalue = a.first;
  FirebaseFirestore fire = FirebaseFirestore.instance;
  final Reference firestorage = FirebaseStorage.instance.ref();
  String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();
  final priceController = TextEditingController();
  final nameController = TextEditingController();
  final sizeController = TextEditingController();
  final qtyController = TextEditingController();
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
            )),
        title: Text("Upload product",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 30,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedImage != null
                            ? FileImage(selectedImage!)
                            // ignore: prefer_const_constructors
                            : AssetImage(
                                    "assets/5ff089db70274bdaa8584427fbb72ec5.jpg",)
                                as ImageProvider<Object>,fit: BoxFit.cover),
                    border: Border.all(color: Colors.pink),
                  ),
                  child: IconButton(
                      onPressed: _pickedImageGallery,
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.pink,
                        size: 40,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dress Name",
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 220,
                      child: TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(7)),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 220,
                      child: TextFormField(
                          controller: priceController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(7)),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Available Size",
                  style:
                      GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
              const SizedBox(
                height: 30,
              ),
              // ignore: prefer_const_constructors
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "XS",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "S",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "M",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "L",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "XL",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "XXL",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 15),
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Quantity",
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextFormField(
                          controller: qtyController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(7)),
                          )),
                    ),
                  ],
                ),
              ),
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 20,
              //       width: 20,
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.pink),
              //           borderRadius: BorderRadius.circular(50)),
              //     ),
              //     const SizedBox(width: 20,),
              //     Text("Post",style: GoogleFonts.pacifico(
              //               color: Colors.pink, fontSize: 20)),
              //               const SizedBox(width: 10,),
              //                Container(
              //       height: 20,
              //       width: 20,
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.pink),
              //           borderRadius: BorderRadius.circular(50)),
              //     ),
              //     const SizedBox(width: 20,),
              //     Text("Reel",style: GoogleFonts.pacifico(
              //               color: Colors.pink, fontSize: 20))
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 252, 158, 189))),
                      onPressed: () async {
                        if (selectedImage != null) {
                          Reference referenceImageToUpload =
                              firestorage.child(uniqueImageName);
                          try {
                            await referenceImageToUpload
                                .putFile(selectedImage!);
                            imageURL =
                                await referenceImageToUpload.getDownloadURL();
                          } catch (e) {
                            print(e);
                          }
                        }
                        drs.dressView(imageURL.toString(), nameController.text,
                            priceController.text, qtyController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileDesigner()));
                      },
                      child: Text(
                        "Upload",
                        style: GoogleFonts.inknutAntiqua(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
