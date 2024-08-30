import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Shop/addrequest.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
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
        title: Text("Request",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 130,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/7665529cfc9ca78b43a73d3f951d8ca7.jpg"))),
                      // color: Colors.pink,
                      // child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.add_circle_outline_outlined,
                      //         color: Colors.white,size: 50,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Text("Send to:",style:GoogleFonts.pacifico(color:Colors.pink), ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("All",style:GoogleFonts.pacifico(color:Colors.black), ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 370,left: 260),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRequest()));
              }, icon: Icon(Icons.add_circle_outline,color: Colors.pink,size: 60,)),
            )
          ],
        ),
        
      ),
    );
  }
}
