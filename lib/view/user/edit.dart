import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.pink,
              size: 30,
            )),
        title: Text(
          "Edit Profile",
          style: GoogleFonts.pacifico(color: Colors.pink),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(left: 330, top: 270),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 170, left: 80),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/fd3204f6a96131bfc87294db5118dd36.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 220, top: 320),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Name",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Address",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.pacifico(),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Email",
                        hintStyle: GoogleFonts.pacifico(),),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()));
                    },
                    child: Text(
                      "Update",
                      style: GoogleFonts.inknutAntiqua(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
