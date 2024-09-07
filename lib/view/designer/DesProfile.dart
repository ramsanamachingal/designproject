import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/designer/Descontact.dart';
import 'package:login/view/designer/Postupload.dart';
import 'package:login/view/designer/VideoUpload.dart';


class ProfileDesigner extends StatefulWidget {
  const ProfileDesigner({super.key});

  @override
  State<ProfileDesigner> createState() => _ProfileDesignerState();
}

class _ProfileDesignerState extends State<ProfileDesigner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
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
      ),
    );
  }
}
