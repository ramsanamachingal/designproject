import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Service/clsDesigner.dart';
import 'package:login/view/user/designerprofile.dart';

FirebaseFirestore fire = FirebaseFirestore.instance;
Designer dsgn = Designer();

class Designers extends StatefulWidget {
  const Designers({super.key});

  @override
  State<Designers> createState() => _DesignersState();
}

class _DesignersState extends State<Designers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.pink,
            size: 30,
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.pink)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.pink,
                    size: 30,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.pacifico(
                      color: Colors.black.withOpacity(0.5), fontSize: 20)),
            ),
            StreamBuilder(
                stream: fire.collection("Designer").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No designer profile",
                        style: GoogleFonts.pacifico(color: Colors.black),
                      ),
                    );
                  }
                  final alldesigners=snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: alldesigners.length,
                        itemBuilder: (context, index) {
                          final Map<String,dynamic> onedsgnr=alldesigners[index].data() as Map<String,dynamic>;
                          final String imageUrl =onedsgnr['image'] ??'';
                          final String dsgnrname=onedsgnr['Designer name:']?? '';
                          final String phone=onedsgnr['phone number']??'';
                          //dsgnr id kittan
                         
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DesignerProfile()));
                                    },
                                    child: Container(
                                      height: 110,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.pink,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Row(
                                              children: [
                                                 CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: imageUrl==''
                                                  // ignore: prefer_const_constructors
                                                  ?AssetImage('assets/0ac3947a0ff36ce5d0ef3da5560c1b7a.jpg')
                                                  as ImageProvider
                                                  :NetworkImage(imageUrl)
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        dsgnrname,
                                                       //onedsgnr['Designer name'],
                                                        style: GoogleFonts
                                                            .pacifico(
                                                                color: Colors
                                                                    .black,),
                                                      ),
                                                      Text(
                                                        phone,
                                                        style: GoogleFonts
                                                            .pacifico(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.pink,
                                                size: 20,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.pink,
                                                size: 20,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.pink,
                                                size: 20,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.grey,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
