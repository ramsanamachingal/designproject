import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/AddDesigner.dart';
import 'package:login/Admin/adShoppers.dart';
import 'package:login/Service/clsDesigner.dart';
Designer dsgn=Designer();
FirebaseFirestore fire=FirebaseFirestore.instance;
class Adhome extends StatefulWidget {
  const Adhome({super.key});

  @override
  State<Adhome> createState() => _AdhomeState();
}
Designer d=Designer();

File? selectedImage;

class _AdhomeState extends State<Adhome> {
  final dsgnrnameController=TextEditingController();
  final dsgnrimagecontroller=TextEditingController();
  final dsgnrshopnamecontroller=TextEditingController();
  final dsgnrphonecontroller=TextEditingController();
  String image='';
  //d.designersView(dsgnrnameController.text, dsgnrphonecontroller, dsgnrshopnamecontroller, dsgnrimagecontroller);

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
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu,color: Colors.pink,)),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       child: Text("Designers"),
        //     ),
        //     Tab(
        //       child: Text("Shop"),
        //     ),
        //   ],
        //   indicatorColor: Colors.pink,
        //   indicatorSize: TabBarIndicatorSize.tab,
        // ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: const BorderSide(color: Colors.white))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.pink)),
                  onPressed: () {},
                  child: Text(
                    "Designers",
                    style: GoogleFonts.pacifico(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: const BorderSide(color: Colors.pink))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminShoppers()));
                  },
                  child: Text(
                    "Shoppers",
                    style: GoogleFonts.pacifico(color: Colors.pink),
                  )),
            ],
          ),
          StreamBuilder(
            stream: fire.collection("Designer").snapshots(),
            builder: (context,snapshot){
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No user profiles found'));
              }
              final alldesigner=snapshot.data!.docs;
            return Expanded(
              child: ListView.builder(
                  itemCount: alldesigner.length,
                  itemBuilder: (context, index) {
                    final onedsgnr=alldesigner[index].data() as Map<String,dynamic>;
                    //String image=onedsgnr[Image];
                    print(onedsgnr.values);
                    print('kkkkkkkkkkkkkkkkkkkkkk');
                    final dsgnrid=alldesigner[index].id;
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
                                    backgroundImage:
                                    image == ''
                                  ? AssetImage("assets/image.png")
                                  : NetworkImage(image) as ImageProvider,
                                    radius: 60,

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
                                          onedsgnr['phone number'].toString(),
                                          style: GoogleFonts.pacifico(
                                              color: Colors.pink),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                                    BorderRadius.circular(7),
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
            );}
              
  )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDesigner()));
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.pink,
          size: 35,
        ),
      ),
      // TabBarView(children: [
      //   designers(),
      //   shoppers(),
      // ],)
    );
  }
}

// designers() {
//   ListView.builder(itemBuilder: (builder, context) {
//     return const ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             AssetImage("assets/07e9ed3375cbffee32362548148529b3.jpg"),
//       ),

//     );
//   });
// }
// shoppers(){

// }