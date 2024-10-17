// ignore: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/Shop/ShDesignerProfile.dart';
import 'package:login/view/Shop/shpayment.dart';

class ShDesignerProduct extends StatefulWidget {
  final String dressId;
  final String userid;
  const ShDesignerProduct(
      {super.key, required this.dressId, required this.userid});

  @override
  State<ShDesignerProduct> createState() => _ShDesignerProductState();
}

class _ShDesignerProductState extends State<ShDesignerProduct> {
  String checkit = '';
  String selectedSize = "";
  Set<int> selectedIndices = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_sharp,
              color: Colors.pink,
            )),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            }

            Map<String, dynamic> alldress = snapshot.data!;
            List<dynamic> availablesize = alldress['size'];
            String image = alldress['image'];
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Stack(children: [
                              Container(
                                height: 280,
                                width: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: selectedImage == ''
                                            ? const AssetImage(
                                                    "assets/60b6980613b92e7b9913f40d32a59bc7.jpg")
                                                as ImageProvider
                                            : NetworkImage(image),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 200, top: 240),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[300],
                                  size: 30,
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      alldress['name'],
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
                                  alldress['designername'],
                                  style: GoogleFonts.pacifico(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Text(
                                  alldress['price'],
                                  style: GoogleFonts.pacifico(
                                      color: Colors.black, fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Available Size",
                                  style: GoogleFonts.pacifico(
                                      color: Colors.pink[300], fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: availablesize.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1.0,
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 1.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      bool isSelected =
                                          selectedIndices.contains(index);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              selectedIndices.remove(
                                                  index); // Deselect if already selected
                                            } else {
                                              selectedIndices.add(
                                                  index); // Select if not selected
                                            }
                                            print(
                                                "Selected size: ${availablesize[index]}");
                                            selectedSize = availablesize[index];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.pink
                                                : Colors.grey,
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Center(
                                              child: Text(
                                            '${availablesize[index]}',
                                            style: GoogleFonts.inknutAntiqua(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                Row(
                                  children: [
                                    // Add this method to your _ShDesignerProductState class

// Modify the Payment button onPressed function
                                    SizedBox(
                                      height: 40,
                                      width: 180,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              side: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 252, 158, 189),
                                          ),
                                        ),
                                        onPressed: () {
                                          checkit = "designer";
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShopPayment(
                                                        userId: widget.userid,
                                                        dressId: widget.dressId,
                                                        check: checkit,
                                                        dressSize: selectedSize,
                                                      )));
                                        },
                                        child: Text(
                                          "Payment",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                        height: 40,
                                        width: 180,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        side: const BorderSide(
                                                            color:
                                                                Colors.white))),
                                                backgroundColor:
                                                    const MaterialStatePropertyAll(
                                                        Color.fromARGB(255, 252,
                                                            158, 189))),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShDesignerProfile(
                                                              userId: widget
                                                                  .userid)));
                                            },
                                            child: Text(
                                              "View profile",
                                              style: GoogleFonts.pacifico(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  side: const BorderSide(
                                                      color: Colors.white))),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 252, 158, 189))),
                                      onPressed: () {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopBag()));
                                      },
                                      child: Text(
                                        "Request",
                                        style: GoogleFonts.pacifico(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ),
                                // TextFormField(decoration: InputDecoration(
                                //   fillColor: Colors.pink[300],
                                //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),),)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          }),
    );
  }

 Future<Map<String, dynamic>> fetchData() async {
  Map<String, dynamic> designerName = {};
  QuerySnapshot dsgnrname = await FirebaseFirestore.instance.collection('Designer').get();

  for (var doc in dsgnrname.docs) {
    if (doc.id == widget.userid) {
      designerName = {'designername': doc['Designer name:']};
    }
  }

  QuerySnapshot snapshotp = await FirebaseFirestore.instance
      .collection('DesignerDress')
      .doc(widget.userid)
      .collection('dress')
      .where(FieldPath.documentId, isEqualTo: widget.dressId)
      .get();

  if (snapshotp.docs.isNotEmpty) {
    var docs = snapshotp.docs.first; // Get the first document
    Map<String, dynamic> dressData = {
      "name": docs['Dress name'],
      "image": docs['image'],
      "price": docs['price'],
      "id": docs.id,
      "size": docs['size'],
    };

    // Handle 'size' as a list or string
    if (dressData['size'] is String) {
      String sizeString = dressData['size'].replaceAll('[', '').replaceAll(']', '').trim();
      dressData['size'] = sizeString.split(',').map((size) => size.trim()).toList();
    }

    Map<String, dynamic> mergedData = {};
    mergedData.addAll(designerName);
    mergedData.addAll(dressData);
    print(mergedData);
    return mergedData;
  } else {
    // Handle empty dress query result
    throw Exception("Dress not found");
  }
}

}
