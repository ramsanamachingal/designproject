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
       appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.pink,
          size: 30,
        ),
      )
          ,bottom: PreferredSize(preferredSize: Size.fromHeight(
            10
          ), child: Divider(color: Colors.pink,)),
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Stack(children: [
                  Container(
                    height: 280,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover)),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 240),
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Colors.pink[300],
                      size: 30,
                    ),
                  )
                ]),
                SizedBox(width: 10,),
                Container(
                    height: 280,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 280,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover)),
                  ),
          ],), 
        ),
        SizedBox(height: 20,),
         
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
                SizedBox(height: 20,),
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
                const SizedBox(height: 50,),
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
                                            child:  Text("Add to bag",style:GoogleFonts.pacifico(color:Colors.white,fontSize:20),),),),
                                                               
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
      
                                                                          }, icon: Icon(Icons.arrow_drop_down,color: Colors.pink[300],)),
                                                                          // DropdownMenu(dropdownMenuEntries: a.map((value){
                                                                          //   return DropdownMenuItem(value: value,child: Text(value));
                                                                          // }).)
                                                                        ],
                                                                      ),
                                                                    )
                                                                    ]
                                                                 ,
                                                                 ),
                                                               )
                                                               ],
                ),
                
                // TextFormField(decoration: InputDecoration(
                //   fillColor: Colors.pink[300],
                //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),),)
      
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}
