import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Container(
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
                  color: Colors.pink,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline_outlined,
                          color: Colors.white,size: 50,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 50),
                  child: ElevatedButton(style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(color: Colors.white))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 252, 158, 189))) ,onPressed: (){}, child: Text("Send",style: 
                  GoogleFonts.pacifico(color:Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
