import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vaccancies extends StatefulWidget {
  const Vaccancies({super.key});

  @override
  State<Vaccancies> createState() => _VaccanciesState();
}

class _VaccanciesState extends State<Vaccancies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 200,
                      width: 350,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/49595cfbc79f547e6dfa611aad355745.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("MAX Fashion",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      Text("Manjeri-malappuram",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      Text("Kerala",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      Text("9087654321",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.pink,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(width: 10,),
                                 CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.pink,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.chat_rounded,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(width: 50,),
                                 ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            side: const BorderSide(
                                                color: Colors.white))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(
                                                255, 252, 158, 189))),
                                onPressed: () {},
                                child: Text(
                                  "Apply now",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white),
                                )),
                              ],
                            ),
                          ),
                          
                          
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
