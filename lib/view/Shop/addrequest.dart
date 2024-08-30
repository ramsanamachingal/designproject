import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Shop/request.dart';

List<String> a = ["All", "Rose", "Catherine", "Roma"];

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  String dropvalue = a.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.pink,
            )),
        title: Text("Request",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20)),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
        toolbarHeight: 30,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 650,
                width: 350,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.pink)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 380,
                          width: 230,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(7)),
                          //decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/7665529cfc9ca78b43a73d3f951d8ca7.jpg"))),
                          // color: Colors.pink,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.pink,
                                size: 50,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send to:",
                              style: GoogleFonts.pacifico(
                                  color: Colors.pink, fontSize: 20),
                            ),
                            // Text("All",style:GoogleFonts.pacifico(color:Colors.black), ),
                            TextFormField(
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(color: Colors.pink)),
                              suffixIcon: DropdownButton(
                                  items: a.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: ((value) {
                                    dropvalue = value!;
                                  })),
                            )),
                            const SizedBox(height: 30,),
                            Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              side: const BorderSide(
                                                  color: Colors.white))),
                                      backgroundColor: const MaterialStatePropertyAll(
                                          Colors.pink)),
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const Request()));},
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.pacifico(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
