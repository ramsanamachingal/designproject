import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Admin/AddDesigner.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/Admin/adShoppers.dart';
import 'package:login/Admin/request.dart';
import 'package:login/Service/clsDesigner.dart';

Designer dsgn = Designer();
FirebaseFirestore fire = FirebaseFirestore.instance;

class Adhome extends StatefulWidget {
  const Adhome({super.key});

  @override
  State<Adhome> createState() => _AdhomeState();
}



class _AdhomeState extends State<Adhome> {
 
  @override
  Widget build(BuildContext context) {
    

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.pink)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RequestPage()));
              },
              icon: const Icon(
                Icons.message_outlined,
                color: Colors.pink,
              ))
        ],
      ),
      
      body:const DefaultTabController(length: 2, child: Column(
        children:  [
         TabBar(tabs: [
          Tab(text: "Designers",),
          Tab(text: "shoppers",)
         ]),
         Expanded(
           child: TabBarView(children: [
            AdminDesigners(),
            AdminShoppers()
           ]),
         )
        ],
      ))         );
  }
}
