import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Service/usercls.dart';
import 'package:login/view/function.dart/style.dart';
import 'package:login/view/user/home.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController=TextEditingController();
  final addressController=TextEditingController();
  final PhnController=TextEditingController();
  final emailController=TextEditingController();
final currentid=FirebaseAuth.instance.currentUser!.uid;
  
  final FirebaseFirestore fire=FirebaseFirestore.instance;
  final Reference _fireStorage=FirebaseStorage.instance.ref().child('image');
  String unqImg=DateTime.now().microsecondsSinceEpoch.toString();
  FirebaseAuth auth=FirebaseAuth.instance;
  String? imageUrl;
  File? selectedImage;
  UserClass us=UserClass();

  Future<void>_pickedImageGallery()async{
    final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage == null)return;
    setState(() {
      selectedImage=File(pickedImage.path);
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
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.pink,
              size: 30,
            )),
        title: Text(
          "Edit Profile",
          style: GoogleFonts.pacifico(color: Colors.pink),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Stack(
                    children: [ Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: selectedImage != null
                                      ? FileImage(selectedImage!)
                                      : const AssetImage(
                                              "assets/5ff089db70274bdaa8584427fbb72ec5.jpg")
                                          as ImageProvider<Object>,fit: BoxFit.cover
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 200,
                              width: 200,
                    ),
                    Padding(
                  padding: const EdgeInsets.only(left: 130,top: 150  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink,
                    child: IconButton(
                        onPressed: _pickedImageGallery,
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
          ])
                ),
                
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Name",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Address",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: PhnController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Email",
                        hintStyle: GoogleFonts.pacifico(),),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(color: Colors.white))),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 252, 158, 189))),
                    onPressed: () async{
                      if(selectedImage!=null){
                        Reference referenceImageToUpload=_fireStorage.child(unqImg);
                        try{
                          await referenceImageToUpload.putFile(selectedImage!);
                          imageUrl=await referenceImageToUpload.getDownloadURL();
                        }
                        catch(e){
                          print(e);
                        }
                      }
                      us.userSample(currentid, nameController.text, addressController.text, PhnController.text, emailController.text,  imageUrl.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  packages(indexnum: 2,)));
                    },
                    child: Text(
                      "Update",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
