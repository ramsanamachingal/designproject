import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
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
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
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
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "XS",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Quantity",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.pink,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
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
                                        height: 10,
                                      ),
                                      Text(
                                        "389 rupees payed successfully",
                                        style: GoogleFonts.pacifico(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
                                                          Color.fromARGB(255,
                                                              252, 158, 189))),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return SizedBox(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ListTile(
                                                                tileColor:
                                                                    Colors.pink,
                                                                leading: const Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                title: Text(
                                                                  "maya",
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              const Divider(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                  Icons
                                                                      .location_on_sharp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                tileColor:
                                                                    Colors.pink,
                                                                title: Text(
                                                                  "machingal(h),aravankara-malappuram,pin:676504",
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              const Divider(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                  Icons.phone,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                tileColor:
                                                                    Colors.pink,
                                                                title: Text(
                                                                  "9087564321",
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              SizedBox(height: 40,),
                                                              ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                          shape:
                                                                              MaterialStatePropertyAll(
                                                                            RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(7),
                                                                              side: const BorderSide(color: Color.fromARGB(255, 250, 154, 186)),
                                                                            ),
                                                                          ),
                                                                          backgroundColor: MaterialStatePropertyAll(Colors.pink[
                                                                              100])),
                                                                  onPressed:
                                                                      () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                  child: Text(
                                                                    "Done",
                                                                    style: GoogleFonts
                                                                        .pacifico(
                                                                            color:
                                                                                Colors.white),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetail()));
                                              },
                                              child: Text(
                                                "Detail",
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
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
