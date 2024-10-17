import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/Auth/ShopLogin.dart';
import 'package:login/view/Auth/Type.dart';

class ShopDrawer extends StatefulWidget {
  const ShopDrawer({super.key});

  @override
  State<ShopDrawer> createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {
  @override
  Widget build(BuildContext context) {
    final currentuid = FirebaseAuth.instance.currentUser!.uid;
    return Drawer(
      child: StreamBuilder(
          stream: fire.collection('shop').doc(currentuid).snapshots(),
          builder: (context, snapshot) {
            final oneshop = snapshot.data!;
            String imageUrl = oneshop['image'];
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: imageUrl == ''
                      ? AssetImage(
                              "assets/49595cfbc79f547e6dfa611aad355745.jpg")
                          as ImageProvider
                      : NetworkImage(imageUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  oneshop['Shop name:'],
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
