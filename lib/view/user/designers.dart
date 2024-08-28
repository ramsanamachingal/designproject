import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/designerprofile.dart';

class Designers extends StatefulWidget {
  const Designers({super.key});

  @override
  State<Designers> createState() => _DesignersState();
}

class _DesignersState extends State<Designers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.pink,
            size: 30,
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.pink)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.pink,
                    size: 30,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.pacifico(
                      color: Colors.black.withOpacity(0.5), fontSize: 20)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: 
                                (context)=>DesignerProfile()));
                              },
                              child: Container(
                                height: 110,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.pink,
                                    ),
                                    borderRadius: BorderRadius.circular(7)),
                                    child: Column(
                                      children: [
                                        Padding(
                                padding: const EdgeInsets.only(left: 20,top: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(radius: 30,backgroundImage: AssetImage("assets/fd3204f6a96131bfc87294db5118dd36.jpg"),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Column(
                                      children: [
                                        Text("Rosse Marry",style: GoogleFonts.pacifico(color:Colors.black),),
                                        Text("7907048473",style: GoogleFonts.pacifico(color:Colors.black),),
                              
                                      ],
                                    ),
                                  )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                                        children: [
                              Icon(Icons.star,color: Colors.pink,size: 20,),
                              Icon(Icons.star,color: Colors.pink,size: 20,),
                              Icon(Icons.star,color: Colors.pink,size: 20,),
                              Icon(Icons.star,color: Colors.grey,size: 20,),
                              Icon(Icons.star,color: Colors.grey,size: 20,)
                                                        ],
                                                      ),
                                                      
                                                      
                                      ],
                                    ),
                              ),
                            )
                            ,
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
