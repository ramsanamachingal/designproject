
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Service/firebase.dart';
import 'package:login/Service/usercls.dart';

import 'package:login/view/Auth/phone.dart';

import 'package:login/view/user/edit.dart';
 UserClass userob=UserClass();
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _addressController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseFirestore fire=FirebaseFirestore.instance;
  final Reference _fireStorage=FirebaseStorage.instance.ref().child('image');
  String uniqueImageName=DateTime.now().microsecondsSinceEpoch.toString();
  String? imageUrl;
  File? selectedImage;

  FirebaseService obj = FirebaseService();
Future<void>_pickedImageGallery()async{
  final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickedImage==null)return;
  setState(() {
    selectedImage=File(pickedImage.path);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/0e7b6fa2a031eda2175e210ff787dd5c.jpg"))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   decoration:  BoxDecoration(image: DecorationImage(
                    //     image: selectedImage !=null
                    //     ?FileImage(selectedImage!)
                    //     :const AssetImage("assets/5ff089db70274bdaa8584427fbb72ec5.jpg")
                    //     as ImageProvider<Object> ,fit: BoxFit.cover),
                    //     shape: BoxShape.circle,
                    //     color: Colors.pink[100]
                    //     ),
                    //     height: 100,
                    //     width: 100,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 60,top: 60),
                    //       child: IconButton(onPressed: _pickedImageGallery, 
                    //       icon: const Icon(Icons.camera_alt_rounded,color: Colors.white,)),
                    //     ),
                    // ),
                     const SizedBox(
                      height: 70,
                    ),
                    // TextFormField(
                    //   controller: _usernameController,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(7),
                    //           borderSide:
                    //               const BorderSide(color: Colors.black)),
                    //       hintText: "User name",
                    //       hintStyle:
                    //           GoogleFonts.inknutAntiqua(color: Colors.black),
                    //       prefixIcon: Icon(
                    //         Icons.person_outline,
                    //         color: Colors.black.withOpacity(0.5),
                    //       )),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "please enter the username";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                   
                    // SizedBox(height: 30,),
                    TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          hintText: "E mail",
                          hintStyle:
                              GoogleFonts.inknutAntiqua(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black.withOpacity(0.5),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter the email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          hintText: "Phone Number",
                          hintStyle:
                              GoogleFonts.inknutAntiqua(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            color: Colors.black.withOpacity(0.5),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter the phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // TextFormField(
                    //   controller: _addressController,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(7),
                    //           borderSide:
                    //               const BorderSide(color: Colors.black)),
                    //       hintText: "Address",
                    //       hintStyle:
                    //           GoogleFonts.inknutAntiqua(color: Colors.black),
                    //       prefixIcon: Icon(
                    //         Icons.place_outlined,
                    //         color: Colors.black.withOpacity(0.5),
                    //       )),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "please enter the address";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    TextFormField(
                      controller: _newPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          hintText: "New Password",
                          hintStyle:
                              GoogleFonts.inknutAntiqua(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: Colors.black.withOpacity(0.5),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter the New Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          hintText: "Confirm Password",
                          hintStyle:
                              GoogleFonts.inknutAntiqua(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.black.withOpacity(0.5),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter the confirm password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side:
                                        const BorderSide(color: Colors.white))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 252, 158, 189))),
                        onPressed: () async{
                          if(selectedImage !=null){
                            Reference reference=_fireStorage.child(uniqueImageName);
                            try{
                              await reference.putFile(selectedImage!);
                              imageUrl=await reference.getDownloadURL();

                            }
                            catch(e){
                              print(e);
                            }
                          }
                          if(_formkey.currentState!.validate()){
                             signUp();

                          }
                         
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>packages(indexnum: 0)));
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.inknutAntiqua(color: Colors.white),
                        )),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PhoneNumberScreen()));
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.pink,
                            )),
                        IconButton(
                            onPressed: () {
                              obj.signInWithGoogle(context);
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleScreen()));
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.pink,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    String email = _emailController.text;
    String password = _newPasswordController.text;
    print(email);
    print(password);

    User? user = await obj.signupWithEmailAndPassword(email, password);
    if (user != null) {
      print('User is successfully created');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>EditProfile()
          //  packages(indexnum: 0)
           ));
    } else {
      print('Some error occurred');
    }
    // String id=credential.user!.uid;
    // userob.userSample(id, _usernameController.text, _addressController.text, _phoneController.text, _emailController.text, _newPasswordController.text, imageUrl.toString());
  }
}
