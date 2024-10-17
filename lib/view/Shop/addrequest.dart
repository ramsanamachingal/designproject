import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Service/reqst.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  RequestJob rqst = RequestJob();
  FirebaseFirestore fire = FirebaseFirestore.instance;
  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  String? imageUrl;
  File? selectedimage;

  List<String> designerNames = ["All"]; // Ensure this is a List<String>

  @override
  void initState() {
    super.initState();
    fetchDesigners(); // Fetch designers when the screen initializes
  }

  Future<void> fetchDesigners() async {
    try {
      QuerySnapshot snapshot = await fire.collection('Designer').get();
      List<String> names = snapshot.docs.map((doc) {
        // Ensure that we are getting String values only
        return (doc['Designer name:'] ?? '').toString();
      }).toList();
      setState(() {
        designerNames.addAll(names);
      });
    } catch (e) {
      print('Error fetching designers: $e');
    }
  }

  Future<void> _pickedImageGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedimage = File(pickedImage.path);
    });
  }

  final Reference firestorage = FirebaseStorage.instance.ref();
  String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();
  String dropvalue = "All"; // Default dropdown value

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
        title: Text("Request",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 30,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 650,
                width: 350,
                decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 380,
                          width: 230,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: selectedimage != null
                                      ? FileImage(selectedimage!)
                                      : AssetImage(
                                              "assets/5ff089db70274bdaa8584427fbb72ec5.jpg")
                                          as ImageProvider,
                                  fit: BoxFit.cover),
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                              onPressed: _pickedImageGallery,
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.pink,
                                size: 50,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send to:",
                              style: GoogleFonts.pacifico(
                                  color: Colors.pink, fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              value: dropvalue,
                              items: designerNames.map((name) {
                                return DropdownMenuItem<String>(
                                    value: name, child: Text(name));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropvalue = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      const BorderSide(color: Colors.pink),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              side: const BorderSide(
                                                  color: Colors.white))),
                                      backgroundColor: const MaterialStatePropertyAll(
                                          Colors.pink)),
                                  onPressed: () async {
                                    if (selectedimage != null) {
                                      Reference referenceImageToUpload =
                                          firestorage.child(uniqueImageName);
                                      try {
                                        await referenceImageToUpload
                                            .putFile(selectedimage!);
                                        imageUrl = await referenceImageToUpload
                                            .getDownloadURL();
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                    rqst.requestView(currentuid,
                                        imageUrl.toString(), dropvalue);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.pacifico(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
