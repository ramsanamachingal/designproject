import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopUpload extends StatefulWidget {
  const ShopUpload({super.key});

  @override
  State<ShopUpload> createState() => _ShopUploadState();
}

class _ShopUploadState extends State<ShopUpload> {
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
        title: Text("Upload product",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 30,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.pink,
                        size: 40,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 220,
                      child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(7)),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Available Size",
                  style:
                      GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
              SizedBox(
                height: 30,
              ),
              // ignore: prefer_const_constructors
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "XS",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "S",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "M",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "L",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "XL",
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                            child: Text(
                          "XXL",
                          style: GoogleFonts.pacifico(
                              color: Colors.pink, fontSize: 15),
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Quantity",
                        style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(7)),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(width: 20,),
                  Text("Post",style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20)),
                            SizedBox(width: 10,),
                             Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(width: 20,),
                  Text("Reel",style: GoogleFonts.pacifico(
                            color: Colors.pink, fontSize: 20))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 252, 158, 189))),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingPage()));
                      },
                      child: Text(
                        "Upload",
                        style: GoogleFonts.inknutAntiqua(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
