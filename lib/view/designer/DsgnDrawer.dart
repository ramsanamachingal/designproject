import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Auth/DesigLogin.dart';

class DesignerDrawer extends StatefulWidget {
  const DesignerDrawer({super.key});

  @override
  State<DesignerDrawer> createState() => _DesignerDrawerState();
}

class _DesignerDrawerState extends State<DesignerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/49595cfbc79f547e6dfa611aad355745.jpg"),
          ),
          const SizedBox(height:10 ,),
          Text("data",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:30),),
          ListTile(title:Text("Logout",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),
          ),onTap: () {
           showDialog(context: context, builder: (BuildContext context) {
             return AlertDialog(title: const Text("Are you sure ?",
             
             ),actions: [
              TextButton(onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DesignerLogin()), (route) => false);
              }, child: const Text("Yes"),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("No")),
             ],
             );
           });
          },)
        ],
      ),
    );
  }
}