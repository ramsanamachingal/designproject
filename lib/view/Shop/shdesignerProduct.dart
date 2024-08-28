import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Shop/ShDesignerProfile.dart';
import 'package:login/view/Shop/shbag.dart';

class ShDesignerProduct extends StatefulWidget {
  const ShDesignerProduct({super.key});

  @override
  State<ShDesignerProduct> createState() => _ShDesignerProductState();
}

class _ShDesignerProductState extends State<ShDesignerProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Stack(children: [
                    Container(
                      height: 280,
                      width: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, top: 240),
                      child: Icon(
                        Icons.heart_broken,
                        color: Colors.pink[300],
                        size: 30,
                      ),
                    )
                  ]),
                  Container(
                      height: 280,
                      width: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                    ),
                    Container(
                      height: 280,
                      width: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                    ),
            ],), 
          ),
          const SizedBox(height: 20,),
           
            Padding(
              padding: const EdgeInsets.only(
                top: 10,left: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "churidar",
                        style: GoogleFonts.pacifico(
                            color: Colors.black, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.pink[300],
                        size: 25,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.pink[300],
                        size: 25,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.pink[300],
                        size: 25,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 25,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 25,
                      )
                    ],
                  ),
                  Text(
                    "Smitha Designing",
                    style:
                        GoogleFonts.pacifico(color: Colors.black, fontSize: 25),
                  ),
                  Text(
                    "389",
                    style:
                        GoogleFonts.pacifico(color: Colors.black, fontSize: 25),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Available Size",
                    style: GoogleFonts.pacifico(
                        color: Colors.pink[300], fontSize: 25),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.grey,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("XS",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.pink[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("S",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.pink[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("M",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.grey,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("L",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.pink[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("XL",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.grey,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(7),
                        ),child: Center(child: Text("XXL",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
                      ),
                      
                      
                    ],
                  ),
                  const SizedBox(height: 80,),
                  Row(
                    children: [
                      SizedBox(
                                          height: 40,
                                          width: 180,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: const BorderSide(color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 252, 158, 189))),
                                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopBag()));},
                                              child:  Text("Payment",style:GoogleFonts.pacifico(color:Colors.white,fontSize:20),))),
                                                       SizedBox(
                                          height: 40,
                                          width: 180,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: const BorderSide(color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 252, 158, 189))),
                                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShDesignerProfile()));},
                                              child:  Text("View profile",style:GoogleFonts.pacifico(color:Colors.white,fontSize:20),))),
                                                          
                                                             
                                                                
                                                                 ],
                  ),
                  const SizedBox(height: 30,),
                   Center(
                     child: ElevatedButton(
                         style: ButtonStyle(
                                                   shape: MaterialStatePropertyAll(
                                                       RoundedRectangleBorder(
                                                           borderRadius: BorderRadius.circular(7),
                                                           side: const BorderSide(color: Colors.white))),
                                                   backgroundColor: const MaterialStatePropertyAll(
                                                       Color.fromARGB(255, 252, 158, 189))),
                         onPressed: () {
                           //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopBag()));
                           },
                         child:  Text("Request",style:GoogleFonts.pacifico(color:Colors.white,fontSize:20),)),
                   ),
                  // TextFormField(decoration: InputDecoration(
                  //   fillColor: Colors.pink[300],
                  //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),),)
        
                ],
              ),
              
            ),const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}