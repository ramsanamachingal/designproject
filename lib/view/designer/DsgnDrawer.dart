import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Admin/Adhome.dart';
import 'package:login/view/Auth/DesigLogin.dart';
import 'package:login/view/Auth/Type.dart';

class DesignerDrawer extends StatefulWidget {
  const DesignerDrawer({super.key});

  @override
  State<DesignerDrawer> createState() => _DesignerDrawerState();
}

class _DesignerDrawerState extends State<DesignerDrawer> {
  final auth = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder(
          stream: fire.collection('Designer').doc(auth).snapshots(),
          builder: (context, snapshot) {
            final onedesignr = snapshot.data!;
            String imageUrl = onedesignr['image'];
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: imageUrl == ""
                      ? AssetImage(
                              "assets/49595cfbc79f547e6dfa611aad355745.jpg")
                          as ImageProvider
                      : NetworkImage(imageUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  onedesignr['Designer name:'],
                  style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 30),
                ),
                ListTile(
                  title: Text(
                    "Logout",
                    style:
                        GoogleFonts.pacifico(color: Colors.pink, fontSize: 20),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Are you sure ?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TypePage()),
                                      (route) => false);
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No")),
                            ],
                          );
                        });
                  },
                )
              ],
            );
          }),
    );
  }
}
