import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/user/create.dart';
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
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.pacifico(color: Colors.pink),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.pink[100],
                ),
              ),
              Text(
                "Ramsana",
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: Text(
                      "Profile",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: Text(
                      "View bag",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: Text(
                      "order status",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
               Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: Text(
                      "Booking status",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
              Text("Are u a designer or shop owner?would you like to join with us?",style:GoogleFonts.inknutAntiqua(color: Colors.white) ,),
              TextButton(onPressed: (){}, child: Text("info"))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Text(
              //     "Offers",
              //     style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   height: 200,
              //   padding: const EdgeInsets.all(8),
              //   child: GridView.builder(
              //       scrollDirection: Axis.horizontal,
              //       gridDelegate:
              //           const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 1,
              //               childAspectRatio: 1.0,
              //               crossAxisSpacing: 1.0,
              //               mainAxisSpacing: 1.0),
              //       itemCount: 10,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           decoration: const BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage(
              //                       "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),
              //                   fit: BoxFit.cover)),
              //           // child: Center(child: Text("Item $index"),),
              //         );
              //       }),
              // ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Designers Product",
                style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      // ignore: prefer_const_constructors
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDet()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/60b6980613b92e7b9913f40d32a59bc7.jpg",
                                    ),
                                    fit: BoxFit.cover)),
                            //child: Center(child: Text("item $index"),),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Shoppers Product",
                style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductDet()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover)),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateDesign()));
      },
      child: const Icon(Icons.add_circle,color: Colors.pink,size: 40,),),

      // body:  Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //     Text("Designers Profuct",style: GoogleFonts.pacifico(color:Colors.black,fontSize:25),),
      //     Expanded(
      //       child: GridView.builder(
      //         scrollDirection: Axis.horizontal,
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,crossAxisSpacing: 10,mainAxisSpacing: 10),itemCount: 4,itemBuilder: (context,index){
      //         return GestureDetector(
      //           onTap: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDet()));
      //           },
      //           child: Container(
      //             height: 80,width: 180,
      //             decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/60b6980613b92e7b9913f40d32a59bc7.jpg"),fit: BoxFit.cover),
      //               border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(7),color: Colors.black),

      //           ),
      //         );

      //       }),
      //     ),
      //     Text("Shoppers product",style: GoogleFonts.pacifico(color:Colors.black,fontSize:25),),
      //     // GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context,index){
      //     //   return Container(
      //     //     height: 80,width: 150,
      //     //     decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image.png"))),
      //     //   );
      //     // })
      //   ],),
      // ),
    );
  }
}
