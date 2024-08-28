import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerHome extends StatefulWidget {
  const DesignerHome({super.key});

  @override
  State<DesignerHome> createState() => _DesignerHomeState();
}

class _DesignerHomeState extends State<DesignerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.pink,
            )),
        title: Text(
          "Home",
          style: GoogleFonts.pacifico(color: Colors.pink),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Divider(
            color: Colors.pink,
          ),
        ),toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 300,
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
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),
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
                                      Row(
                                        children: [
                                          Text(
                                            "Size",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.pink,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "XS",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Quantity",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.pink,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "1",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/0ac3947a0ff36ce5d0ef3da5560c1b7a.jpg"),
                                            radius: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Rayon",
                                              style: GoogleFonts.pacifico(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("red",
                                              style: GoogleFonts.pacifico(
                                                  color: Colors.black,
                                                  fontSize: 15))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Type",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.pink,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Plain",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Booking Date:",
                                style: GoogleFonts.pacifico(
                                    color: Colors.pink, fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "29/12/2024",
                                style: GoogleFonts.pacifico(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Time:",
                                style: GoogleFonts.pacifico(
                                    color: Colors.pink, fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Morning",
                                style: GoogleFonts.pacifico(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
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
                                  "Done",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white),
                                )),
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
