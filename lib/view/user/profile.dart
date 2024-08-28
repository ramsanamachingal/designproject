import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                  child: Container(
                //color: Colors.black,
                height: 300, width: 380,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/af2753cb460f804a08f61d8da0a099c2.jpg"),
                        fit: BoxFit.cover)),
              )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 330, top: 270),
              //   child: CircleAvatar(
              //     radius: 25,
              //     backgroundColor: Colors.pink,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.camera_alt_outlined,
              //           color: Colors.white,
              //           size: 30,
              //         )),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 170, left: 80),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      AssetImage('assets/fd3204f6a96131bfc87294db5118dd36.jpg'),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 220, top: 320),
              //   child: CircleAvatar(
              //     radius: 25,
              //     backgroundColor: Colors.pink,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.camera_alt_outlined,
              //           color: Colors.white,
              //           size: 30,
              //         )),
              //   ),
              // ),
            ],
          ),
          Center(
            child: Column(children: [
              Text("Sree Lakshmi",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:30),),
              const SizedBox(height: 20,),
              Text("Malappuram",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),),
              Text("7907048476",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),),
              Text("Sree@gmail.com",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),),
            
            ],),
          ),
          const SizedBox(height: 90,),
           Center(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                  height: 40,
                  width: 140,
                   child: ElevatedButton(
                       style: ButtonStyle(
                                             shape: MaterialStatePropertyAll(
                                                 RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(7),
                                                     side: const BorderSide(color: Colors.white))),
                                             backgroundColor: const MaterialStatePropertyAll(
                                                 Color.fromARGB(255, 252, 158, 189))),
                       onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()));},
                       child:  Text("Edit",style:GoogleFonts.inknutAntiqua(color:Colors.white),)),
                 ),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                                         style: ButtonStyle(
                                         shape: MaterialStatePropertyAll(
                                             RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(7),
                                                 side: const BorderSide(color: Colors.white))),
                                         backgroundColor: const MaterialStatePropertyAll(
                                             Color.fromARGB(255, 252, 158, 189))),
                                         onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()));},
                                         child:  Text("Remove",style:GoogleFonts.inknutAntiqua(color:Colors.white),)),
                      )
               ],
             ),
           ),
               
        ],
      ),
    );
  }
}
