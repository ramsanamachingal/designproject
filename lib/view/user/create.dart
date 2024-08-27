import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/booking.dart';
List<String>a=["XS","S","M","L","XL","XXL"];
List<String>b=["plain","Check","Printed",];
class CreateDesign extends StatefulWidget {
  const CreateDesign({super.key});

  @override
  State<CreateDesign> createState() => _CreateDesignState();
}

class _CreateDesignState extends State<CreateDesign> {
  String dropvalue=a.first;
  String dropin=b.first;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.cancel_outlined,
          color: Colors.pink,
          size: 30,
        ),
        title: Text("Create your design",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25)),
            bottom: const PreferredSize(preferredSize:Size.fromHeight(20) , child: Divider(color: Colors.pink,)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(
            child: Container(
              width: 350,height: 200,decoration: BoxDecoration(border: Border.all(color: Colors.pink),),child: IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline_rounded,color: Colors.pink,size: 40,)),
            ),
          
          ), const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: [Text("Size",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
              const SizedBox(width: 10,),
                SizedBox(
                                      height: 40,
                                      width: 90,
                                      child: TextFormField(style: const TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide:const BorderSide(color: Colors.pink),
                                                borderRadius: BorderRadius.circular(7)),
                                                suffixIcon:DropdownButton(items: a.map((value){
                                                  return DropdownMenuItem(value: value,child: Text(value));
                                                } ).toList(), onChanged: (value){
                                                  setState(() {
                                                    dropvalue=value!;
                                                  });
                                                })),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Text("Quantity",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
                                    const SizedBox(width: 10,),
                                     SizedBox(
                                height: 40,
                                width: 90,
                                child: TextFormField(style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:const BorderSide(color: Colors.pink),
                                          borderRadius: BorderRadius.circular(7)),
                                  )
                                ),
                              ),

              ],
            ),
            
          ),
          SizedBox(height: 10,),
          Text("Cloth",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 30)),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 1), itemBuilder: ((context, index) {
              return 
              Column(
                children: [CircleAvatar(backgroundImage: AssetImage("assets/0ac3947a0ff36ce5d0ef3da5560c1b7a.jpg"),radius: 20,),Text("Rayon",style: GoogleFonts.pacifico(color: Colors.black, fontSize: 15))],
              );
             
            })),
          ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text("Color",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
  SizedBox(width: 20,),
  SizedBox(
                                height: 40,
                                width: 220,
                                child: TextFormField(style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:const BorderSide(color: Colors.pink),
                                          borderRadius: BorderRadius.circular(7)),
                                  )
                                ),
                              ),
],),
SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  
  Text("Type",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
  SizedBox(width: 20,),
  SizedBox(
                                height: 40,
                                width: 220,
                                child: TextFormField(style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:const BorderSide(color: Colors.pink),
                                          borderRadius: BorderRadius.circular(7)),
                                          suffixIcon: DropdownButton(items: b.map((value){
                                            return DropdownMenuItem(value: value, child: Text(value));
                                          } ).toList(), onChanged: (value){
                                            setState(() {
                                              dropin=value!;
                                            });
                                          })
                                  )
                                ),
                              ),
],),
SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text("Designers",style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
  SizedBox(width: 20,),
  SizedBox(
                                height: 40,
                                width: 220,
                                child: TextFormField(style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:const BorderSide(color: Colors.pink),
                                          borderRadius: BorderRadius.circular(7)),
                                  )
                                ),
                              ),
],),
SizedBox(height: 20,),
 SizedBox(
                                      height: 40,
                                      width: 200,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                                                shape: MaterialStatePropertyAll(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(7),
                                                                        side: BorderSide(color: Colors.white))),
                                                                backgroundColor: MaterialStatePropertyAll(
                                                                    const Color.fromARGB(255, 252, 158, 189))),
                                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()));},
                                          child:  Text("Book",style:GoogleFonts.inknutAntiqua(color:Colors.white),))),
                                      SizedBox(height: 30,)
        ],),
      ),
    );
  }
}
