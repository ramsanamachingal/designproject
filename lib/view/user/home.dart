import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/detail.dart';
import 'package:login/view/user/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Home") ,),
      drawer: Drawer(backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 30),
        child: Column(children: [
          CircleAvatar(radius: 40,backgroundColor: Colors.white,child: CircleAvatar(radius: 35,backgroundColor: Colors.pink[100],),),
          
          Text("Ramsana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),),
          const SizedBox(height: 40,),ListTile(
            leading: const Icon(Icons.person),title: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));

            }, child: Text("Profile",style: GoogleFonts.inknutAntiqua(color:Colors.white),)),
          ),
          const Divider(height: 10,),
          ListTile(
            leading: const Icon(Icons.person),title: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));

            }, child: Text("Profile",style: GoogleFonts.inknutAntiqua(color:Colors.white),)),
          ),
        ],),
      )
      ,),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Designers Profuct",style: GoogleFonts.pacifico(color:Colors.black,fontSize:25),),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,crossAxisSpacing: 10,mainAxisSpacing: 10),itemCount: 4,itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDet()));
                },
                child: Container(
                  height: 80,width: 180,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover),
                    border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(7),color: Colors.black),
                            
                ),
              );
              
            }),
          ),
          Text("Shoppers product",style: GoogleFonts.pacifico(color:Colors.black,fontSize:25),),
          // GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context,index){
          //   return Container(
          //     height: 80,width: 150,
          //     decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image.png"))),
          //   );
          // })
        ],),
      ),
      
      
  );
  }
}
