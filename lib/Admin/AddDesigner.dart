// ignore: file_names
import 'dart:io';
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
  final dsgnrnamecontroller = TextEditingController();
  final dsgnrimagecontroller = TextEditingController();
  final dsgnrshopcontroller = TextEditingController();
  final dsgnrphonecontroller = TextEditingController();
   String? imageUrl;
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
                        controller: dsgnrnamecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(color: Colors.pink)),
                            hintText: "Designer name",
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
                            // CircleAvatar(
                              
                              
                            // backgroundColor: Colors.black,
                            //   radius: 50,
                            //   child: IconButton(
                                
                            //       onPressed: () {},
                            //       icon: const Icon(
                            //         Icons.camera_alt_outlined,
                            //         color: Colors.white,
                            //         size: 30,
                            //       )),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    //height: 40,
                                    width: 200,
                                    child: TextFormField(
                                      controller: dsgnrshopcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide:
                                                const BorderSide(color: Colors.pink)),
                                        hintText: "shop name",
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
                                      controller: dsgnrphonecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide:
                                                const BorderSide(color: Colors.pink)),
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
                onPressed: () {
                  dsgnr.designersView(dsgnrnamecontroller.text,
                      dsgnrphonecontroller.text, dsgnrshopcontroller.text,imageUrl);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Adhome()));
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
