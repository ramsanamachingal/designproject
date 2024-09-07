import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> a = ["XS", "S", "M", "L", "XL", "XXL"];

class AddToBag extends StatefulWidget {
  const AddToBag({super.key});

  @override
  State<AddToBag> createState() => _AddToBagState();
}

class _AddToBagState extends State<AddToBag> {
  String dropvalue = a.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel_outlined,
            color: Color.fromARGB(255, 252, 158, 189),
            size: 30,
          ),
        ),
        title: Text(
          "View Bag",
          style: GoogleFonts.pacifico(color: Colors.pink[300]),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Divider(
              color: Colors.pink[300],
            )),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 260,
                      width: 350,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            height: 200,
                            width: 150,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "churidar",
                                  style: GoogleFonts.pacifico(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Text(
                                  "smritha designing",
                                  style: GoogleFonts.pacifico(
                                      color: Colors.black, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("S",style: GoogleFonts.pacifico(
                                      color: Colors.pink, fontSize: 20),),
        
                                    // SizedBox(
                                    //   height: 40,
                                    //   width: 70,
                                    //   child: TextFormField(
                                    //     style: const TextStyle(color: Colors.black),
                                    //     decoration: InputDecoration(
                                    //         border: OutlineInputBorder(
                                    //             borderSide: const BorderSide(
                                    //                 color: Colors.pink),
                                    //             borderRadius:
                                    //                 BorderRadius.circular(7)),
                                    //         suffixIcon: DropdownButton(
                                    //             items: a.map((value) {
                                    //               return DropdownMenuItem(
                                    //                   value: value,
                                    //                   child: Text(value));
                                    //             }).toList(),
                                    //             onChanged: (value) {
                                    //               setState(() {
                                    //                 dropvalue = value!;
                                    //               });
                                    //             })),
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,width: 120,
                                      decoration: BoxDecoration(border: Border.all(color: Colors.pink),borderRadius: BorderRadius.circular(7),),
                                      child:Row(
                                        children: [
                                           IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                                           Text("5", style: GoogleFonts.pacifico(
                                      color: Colors.pink, fontSize: 20),),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.minimize)),
        
                                        ],
                                      ) ,
                                    )
                                    // SizedBox(
                                    //   height: 40,
                                    //   width: 120,
                                    //   child:
                                    //    TextFormField(
                                    //       style: const TextStyle(color: Colors.black),
                                    //       decoration: InputDecoration(
                                    //         border: OutlineInputBorder(
                                    //             borderSide: const BorderSide(
                                    //                 color: Colors.pink),
                                    //             borderRadius:
                                    //                 BorderRadius.circular(7)),
                                    //                 prefixIcon:
                                    //                 suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.minimize))
                                    //       )),
                                    // ),
                                  ],
                                ),
                                Text(
                                  "389",
                                  style: GoogleFonts.pacifico(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(7),
                                            )),
                                            backgroundColor: const MaterialStatePropertyAll(
                                                Color.fromARGB(255, 252, 158, 189))),
                                        onPressed: () {},
                                        child: Text(
                                          "Remove",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.white, fontSize: 20),
                                        )),
                                        SizedBox(width: 20,),
                                        CircleAvatar(radius: 20,backgroundColor: const Color.fromARGB(255, 240, 142, 175),
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.payment,color: Colors.white,)),
                                        )
                                        
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 30,
                  )
                ],
              );
            }),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: BottomNavigationBarItem(icon: )),
    );
  }
}
