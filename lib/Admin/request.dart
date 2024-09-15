import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.pink,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(7)),
                      height: 200,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 140,
                              width: 100,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/image 4.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top:50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fousiya",
                                    style:
                                        GoogleFonts.pacifico(color: Colors.pink,fontSize:20),
                                  ),
                                  Text(
                                    "Malappuram-kottakkal",
                                    style:
                                        GoogleFonts.pacifico(color: Colors.pink,fontSize:15),
                                  ),
                                  Text(
                                    "9876543210",
                                    style:
                                        GoogleFonts.pacifico(color: Colors.pink,fontSize:20),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                         side: const BorderSide(color: Colors.pink) 
                                        ),),backgroundColor: const MaterialStatePropertyAll(Colors.pink)
                                      ),onPressed: (){
                                      
                                      }, child: Text("Accept",style: GoogleFonts.pacifico(color: Colors.white,fontSize:20) ,)),
                                      const SizedBox(width: 10,),
                                       ElevatedButton(style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                     side: const BorderSide(color: Colors.pink) 
                                    ),),backgroundColor: const MaterialStatePropertyAll(Colors.pink)
                                  ),onPressed: (){

                                  }, child: Text("Reject",style: GoogleFonts.pacifico(color: Colors.white,fontSize:20) ,))
                                    ],
                                  ),
                                 
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
