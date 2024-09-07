import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/info.dart';
import 'package:login/view/user/postscreen.dart';
import 'package:login/view/user/videoscreen.dart';

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
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            // color: Colors.pink,
            height: 50,
            child: const Divider(color: Colors.pink),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/fd3204f6a96131bfc87294db5118dd36.jpg'),
            ),
            Text(
              "Rose Marry",
              style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
            ),
            Text(
              "7907048476",
              style: GoogleFonts.pacifico(fontSize: 25, color: Colors.pink),
            ),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.image, color: Colors.pink)),
                Tab(icon: Icon(Icons.videocam_rounded)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PostScreen(),
                  VideoScreen(),
                  DesignerInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
