import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerProfile extends StatefulWidget {
  const DesignerProfile({super.key});

  @override
  State<DesignerProfile> createState() => _DesignerProfileState();
}

class _DesignerProfileState extends State<DesignerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.pink,
        ),
      )
          // ,bottom: PreferredSize(preferredSize: Size.fromHeight(
          //   20
          // ), child: Divider(color: Colors.pink,)),
          ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
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

            const DefaultTabController(length: 3, child: TabBar(tabs: [
              Tab(icon: Icon(Icons.image,color: Colors.pink,),),
              Tab(icon: Icon(Icons.videocam_rounded,),),
              Tab(icon: Icon(Icons.person,),)
            ])),
            TabBarView(children: [
              // PostScreen(),
              // VideoScreen(),
              // ProfileScreen()
              // GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 3), itemBuilder: (context,index){
              //   return Container(
              //     height: 70,width: 150,
              //     decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/07e9ed3375cbffee32362548148529b3.jpg"))),
              //   );
              // })
            ])
          ],
        ),
      ),
    );
  }
}
