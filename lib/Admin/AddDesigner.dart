// ignore: file_names
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Service/clsDesigner.dart';

Designer dsgnr = Designer();

class AddDesigner extends StatefulWidget {
  const AddDesigner({super.key});

  @override
  State<AddDesigner> createState() => _AddDesignerState();
}

class _AddDesignerState extends State<AddDesigner> {
  final FirebaseFirestore fire = FirebaseFirestore.instance;
  final Reference _fireStorage = FirebaseStorage.instance.ref().child('image');
  String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();

  final TextEditingController dsgnrnamecontroller = TextEditingController();
  final TextEditingController dsgnrshopcontroller = TextEditingController();
  final TextEditingController dsgnrphonecontroller = TextEditingController();
  final TextEditingController dsgnremailcontroller = TextEditingController();
  final TextEditingController dsgnrpasswordcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String? imageUrl;
  File? selectedImage;

  // Function to pick an image from the gallery
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.pink),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: dsgnrnamecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          hintText: "Designer name",
                          hintStyle: GoogleFonts.pacifico(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                                              "assets/af2753cb460f804a08f61d8da0a099c2.jpg")
                                          as ImageProvider<Object>,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
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
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: dsgnrshopcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                        ),
                                        hintText: "Shop name",
                                        hintStyle: GoogleFonts.pacifico(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: dsgnrphonecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                        ),
                                        hintText: "Phone",
                                        hintStyle: GoogleFonts.pacifico(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: dsgnremailcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.pacifico(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: dsgnrpasswordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.pacifico(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.pink),
              ),
              onPressed: () async {
                if (selectedImage != null) {
                  Reference referenceImageToUpload =
                      _fireStorage.child(uniqueImageName);
                  try {
                    await referenceImageToUpload.putFile(selectedImage!);
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (e) {
                    print(e);
                  }
                }
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: dsgnremailcontroller.text,
                    password: dsgnrpasswordcontroller.text).then((credential) async{
                      String id = credential.user!.uid;
                      dsgnr.designersView(
                  dsgnrnamecontroller.text,
                  dsgnrphonecontroller.text,
                  dsgnrshopcontroller.text,
                  imageUrl.toString(),
                  dsgnremailcontroller.text,
                  dsgnrpasswordcontroller.text,
                  id
                );
                    });
                  

                Navigator.pop(context);
              },
              child: Text(
                "Done",
                style: GoogleFonts.pacifico(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
