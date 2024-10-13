import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Shop/shopinfo.dart';
import 'package:login/view/Shop/shpost.dart';
import 'package:login/view/Shop/shvideo.dart';

class ShopProfile extends StatefulWidget {
  const ShopProfile({super.key});

  @override
  State<ShopProfile> createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile> {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        StreamBuilder(
          stream: fire.collection("shop").snapshots(),
           builder: (context,snapshot){
            return DefaultTabController(length: 3,
             child: Column(
              children: [
                StreamBuilder(
            stream: fire.collection("shop").doc(currentuid).snapshots(),
            builder: (context, snapshot) {
              final allshop = snapshot.data!;
              String imageUrl = allshop['image'];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: imageUrl == ''
                        ? const AssetImage(
                                "assets/34f30878d687ed5f545f12f984bf2774.jpg")
                            as ImageProvider
                        : NetworkImage(imageUrl),
                  ),
                  Text(
                    allshop['Shop name:'],
                    style: GoogleFonts.pacifico(
                        fontSize: 30, color: Colors.pink),
                  ),
                  Text(
                    allshop['phone number'],
                    style: GoogleFonts.pacifico(
                        fontSize: 25, color: Colors.pink),
                  ),
                  
                
                ],
              );
            }),
            TabBar(tabs: [
                    Tab(
                      icon: Icon(
                        Icons.image,
                        color: Colors.pink,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.videocam_rounded,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.person,
                      ),
                    )
                  ]),
                    Expanded(
                      child: const TabBarView(children: [
                      ShopPost(),
                      ShopVideeo(),
                      ShopInfo()
                                          ]),
                    )
              ],
             ));
           })
        );
  }
}
