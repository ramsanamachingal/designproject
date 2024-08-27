import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/bag.dart';
List <String>a=["call","chat"];
class ProductDet extends StatefulWidget {
  const ProductDet({super.key});

  @override
  State<ProductDet> createState() => _ProductDetState();
}

class _ProductDetState extends State<ProductDet> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Container(
                        height: 380,
                        width: 250,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 180, top: 340),
                        child: Icon(
                          Icons.heart_broken,
                          color: Colors.pink[300],
                          size: 40,
                        ),
                      )
                    ]);
                  }),
            ),
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
                                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddToBag()));},
                                              child:  Text("Add to bag",style:GoogleFonts.pacifico(color:Colors.white,fontSize:20),))),
                                                                 
                                                                 Center(
                                                                   child: Stack(
                                                                     children:[ Container
                                                                     (height: 40,width: 170,
                                                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 252, 158, 189),border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(7))),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 40,),
                                                                        child: Row(
                                                                          children: [
                                                                            Text("Contact",style: GoogleFonts.pacifico(color:Colors.white,fontSize:20),),
                                                                            IconButton(
                                                                              
                                                                              onPressed: (){

                                                                            }, icon: Icon(Icons.arrow_drop_down,color: Colors.pink[300],))
                                                                          ],
                                                                        ),
                                                                      )
                                                                      ]
                                                                   ,
                                                                   ),
                                                                 )
                                                                 ],
                  ),
                  const SizedBox(height: 30,)
                  // TextFormField(decoration: InputDecoration(
                  //   fillColor: Colors.pink[300],
                  //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),),)

                ],
              ),
              
            ),SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
