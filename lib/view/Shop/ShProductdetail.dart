import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Admin/adDesign.dart';

import 'package:login/view/Shop/shpayment.dart';
import 'package:login/view/Shop/shopsprofile.dart';

class ShProductDetail extends StatefulWidget {
  final String dressId;
  final String userid;
  const ShProductDetail(
      {super.key, required this.dressId, required this.userid});

  @override
  State<ShProductDetail> createState() => _ShProductDetailState();
}

class _ShProductDetailState extends State<ShProductDetail> {
  Set<int> selectedIndices = {};
  String checkit="";
  String selectedSize="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.cancel_sharp,color: Colors.pink,)),),
        body: FutureBuilder<Map<String,dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
               if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        }

        Map<String, dynamic> alldress = snapshot.data!;
        List<dynamic> availablesize = alldress['size']; // Now guaranteed to be a List
        String image = alldress['image'];

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(children: [
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
                            padding: const EdgeInsets.only(left: 200, top: 240),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink[300],
                              size: 30,
                            ),
                          )
                        ]),
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
                                alldress['ShopName'],
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
                                              print('ooooooooooooooooooooooooooooooooooooooo');
                                              print( availablesize[index]);
                                               selectedSize=availablesize[index];
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
                                  SizedBox(
                                      height: 40,
                                      width: 180,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      side: const BorderSide(
                                                          color:
                                                              Colors.white))),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 252, 158, 189))),
                                          onPressed: () {
                                            checkit="shop";
                                           
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         ShopPayment(
                                                           userId: widget.userid, dressId: widget.dressId,check: checkit,dressSize:selectedSize
                                                          )));
                                          },
                                          child: Text(
                                            "Payment",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ))),
                                  SizedBox(
                                      height: 40,
                                      width: 180,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      side: const BorderSide(
                                                          color:
                                                              Colors.white))),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 252, 158, 189))),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         ManyShopsProfile(userId : widget.userid)));
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
                ),
              );
            }));
  }

  Future<Map<String, dynamic>> fetchData() async {
  Map<String, dynamic> shopName = {};

  // Fetching shop data
  QuerySnapshot shopSnapshot = await FirebaseFirestore.instance.collection('shop').get();
  for (var doc in shopSnapshot.docs) {
    if (doc.id == widget.userid) {
      shopName = {'ShopName': doc['Shop name:']};
    }
  }

  // Fetching dress data
  QuerySnapshot dressSnapshot = await FirebaseFirestore.instance
      .collection('ShopDress')
      .doc(widget.userid)
      .collection('shdress')
      .where(FieldPath.documentId, isEqualTo: widget.dressId) // Use the document ID directly
      .get();

  // Check if dress data exists
  if (dressSnapshot.docs.isNotEmpty) {
    var docs = dressSnapshot.docs.first; // Get the first document
    Map<String, dynamic> dressData = {
      "name": docs['Dress name'],
      "image": docs['image'],
      "price": docs['price'],
      "id": docs.id,
      "size": docs['size'],
    };

    // Convert the size string to a List
    if (dressData['size'] is String) {
      // Remove brackets and split by comma to create a List
      String sizeString = dressData['size'].replaceAll('[', '').replaceAll(']', '').trim();
      dressData['size'] = sizeString.split(',').map((size) => size.trim()).toList();
    } else {
      throw Exception('Size field is not a String');
    }

    // Merge shop name and dress data
    Map<String, dynamic> mergedData = {};
    mergedData.addAll(shopName);
    mergedData.addAll(dressData);
    return mergedData;
  } else {
    throw Exception('Dress not found');
  }
}

}
