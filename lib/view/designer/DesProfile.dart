import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/designer/Descontact.dart';
import 'package:login/view/designer/Postupload.dart';
import 'package:login/view/designer/VideoUpload.dart';


class ProfileDesigner extends StatefulWidget {
  const ProfileDesigner({super.key});

  @override
  State<ProfileDesigner> createState() => _ProfileDesignerState();
}

class _ProfileDesignerState extends State<ProfileDesigner> {
  FirebaseFirestore fire=FirebaseFirestore.instance;
  final currentuid=FirebaseAuth.instance.currentUser!.uid;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: fire.collection("Designer").snapshots(),
        builder: (context, snapshot) {

          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                StreamBuilder(
                  stream: fire.collection("Designer").doc(currentuid).snapshots(),

                  builder: (context, snapshot) {
                    final alldsgnr=snapshot.data!;
                    print(alldsgnr.id);
                    print('jhj000000000000000000000000000000000000000000');
                    String imageUrl=alldsgnr['image'];
                    
                    return  Column(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: imageUrl == ''
                                                ? const AssetImage(
                                                        "assets/7665529cfc9ca78b43a73d3f951d8ca7.jpg")
                                                    as ImageProvider
                                                : NetworkImage(imageUrl),
                              
                        ),
                        Text(
                  alldsgnr['Designer name:'],
                  style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
                ),
                Text(
                  "7907048476",
                  style: GoogleFonts.pacifico(fontSize: 25, color: Colors.pink),
                ),
                      ],
                    );
                    
                  }
                ),
                
                // ElevatedButton(onPressed: (){
                //   print(currentuid);
                // }, child: Text("data")),
                const TabBar(tabs: [
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
                const Expanded(
                    child: TabBarView(
                        children: [
                          PostUpload(), 
                          VideoUpload(),
                           DesignerContact()
                           ]
                           )
                           )
              ],
            ),
          );
        }
      ),
    );
  }
}
