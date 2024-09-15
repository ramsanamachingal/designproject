import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/AddDesigner.dart';
import 'package:login/Admin/request.dart';
import 'package:login/Service/clsDesigner.dart';
Designer dsgn = Designer();
FirebaseFirestore fire = FirebaseFirestore.instance;
class AdminDesigners extends StatefulWidget {
  const AdminDesigners({super.key});

  @override
  State<AdminDesigners> createState() => _AdminDesignersState();
}
File? selectedImage;
class _AdminDesignersState extends State<AdminDesigners> {
   final fire = FirebaseFirestore.instance;
  final dsgnrnameController = TextEditingController();
  final dsgnrimagecontroller = TextEditingController();
  final dsgnrshopnamecontroller = TextEditingController();
  final dsgnrphonecontroller = TextEditingController();
  String image = '';

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
      
      body: StreamBuilder(
              stream: fire.collection("Designer").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No user profiles found',
                      style: GoogleFonts.pacifico(color: Colors.black),
                    ),
                  );
                }
                final alldesigners = snapshot.data!.docs;
                
                return Expanded(
                  child: ListView.builder(
                      itemCount: alldesigners.length,
                      itemBuilder: (context, index) {
                        final onedsgnr =
                            alldesigners[index].data() as Map<String, dynamic>;
                        final dsgnrid = alldesigners[index].id;

                        
                        final String imageUrl =
                            onedsgnr['image'] ?? ''; 

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
                                  onedsgnr['Designer name:'].toString(),
                                  style: GoogleFonts.pacifico(
                                      color: Colors.pink, fontSize: 25),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: imageUrl == ''
                                            ? const AssetImage(
                                                    "assets/7665529cfc9ca78b43a73d3f951d8ca7.jpg")
                                                as ImageProvider
                                            : NetworkImage(imageUrl),
                                        radius: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              onedsgnr['Shop name'].toString(),
                                              style: GoogleFonts.pacifico(
                                                  color: Colors.pink),
                                            ),
                                            Text(
                                              onedsgnr['phone number']
                                                  .toString(),
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
                                  onedsgnr['Email'].toString(),
                                  style: GoogleFonts.pacifico(
                                      color: Colors.pink),
                                ),
                                Text(
                                  onedsgnr['Password'].toString(),
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
                                                        BorderRadius.circular(
                                                            7),
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
                                                      const AddDesigner()));
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
                                                        BorderRadius.circular(
                                                            7),
                                                    side: const BorderSide(
                                                        color: Colors.white))),
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Colors.pink)),
                                        onPressed: () {
                                          
                                          dsgn.deleteDesigner(dsgnrid);
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
              }),
               floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddDesigner()));
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