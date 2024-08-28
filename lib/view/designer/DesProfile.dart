import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDesigner extends StatefulWidget {
  const ProfileDesigner({super.key});

  @override
  State<ProfileDesigner> createState() => _ProfileDesignerState();
}

class _ProfileDesignerState extends State<ProfileDesigner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage:
                  AssetImage('assets/fd3204f6a96131bfc87294db5118dd36.jpg'),
            ),
            Text(
              "Rose Marry",
              style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
            ),
            Text(
              "7907048476",
              style: GoogleFonts.pacifico(fontSize: 25, color: Colors.pink),
            ),

            DefaultTabController(length: 3, child: TabBar(tabs: [
              Tab(icon: Icon(Icons.image,color: Colors.pink,),),
              Tab(icon: Icon(Icons.videocam_rounded,),),
              Tab(icon: Icon(Icons.person,),)
            ])),TabBarView(children: [
              GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 3), itemBuilder: (context,index){
                return Container(
                  height: 70,width: 150,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/07e9ed3375cbffee32362548148529b3.jpg"))),
                );
              })
            ])
          ],
        ),
      ),
    );
  }
}