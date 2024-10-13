import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: fire.collection("user").doc(currentuid).snapshots(),
          builder: (context, snapshot) {
            final onedsgnr = snapshot.data!;
            String imageUrl = onedsgnr['image'];
            return Column(
              children: [
                Stack(
                  children: [
                    // Center(
                    //     child: Container(
                    //   //color: Colors.black,
                    //   height: 300, width: 380,
                    //   decoration: const BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(
                    //               "assets/af2753cb460f804a08f61d8da0a099c2.jpg"),
                    //           fit: BoxFit.cover)),
                    // )),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 330, top: 270),
                    //   child: CircleAvatar(
                    //     radius: 25,
                    //     backgroundColor: Colors.pink,
                    //     child: IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //           Icons.camera_alt_outlined,
                    //           color: Colors.white,
                    //           size: 30,
                    //         )),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 30),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: imageUrl == ''
                            ? const AssetImage(
                                    'assets/fd3204f6a96131bfc87294db5118dd36.jpg')
                                as ImageProvider
                            : NetworkImage(imageUrl),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 220, top: 320),
                    //   child: CircleAvatar(
                    //     radius: 25,
                    //     backgroundColor: Colors.pink,
                    //     child: IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //           Icons.camera_alt_outlined,
                    //           color: Colors.white,
                    //           size: 30,
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        onedsgnr['user name'],
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        onedsgnr['address'],
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20),
                      ),
                      Text(
                        onedsgnr['phone no'],
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20),
                      ),
                      Text(
                        onedsgnr['email'],
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        side: const BorderSide(
                                            color: Colors.white))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 252, 158, 189))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile()));
                            },
                            child: Text(
                              "Edit",
                              style: GoogleFonts.inknutAntiqua(
                                  color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        side: const BorderSide(
                                            color: Colors.white))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 252, 158, 189))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile()));
                            },
                            child: Text(
                              "Remove",
                              style: GoogleFonts.inknutAntiqua(
                                  color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
