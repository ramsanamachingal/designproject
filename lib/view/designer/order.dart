import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  String? userName;

  @override
  void initState() {
    super.initState();
    getCurrentUserName();
  }
  Future<void> getCurrentUserName() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("Designer")
        .doc(currentuid)
        .get();

    if (userDoc.exists) {
      setState(() {
        userName = userDoc['Designer name:'];
      });
    }
  }

  Future<Map<String, dynamic>?> getOrderPersonDetails(String userId) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection("user").doc(userId).get();

    if (userSnapshot.exists) {
      Map<String, dynamic> data = {
        "name": userSnapshot.get('user name') ?? "No name provided",
        "address": userSnapshot.get('address') ?? "No address provided",
        "phone": userSnapshot.get('phone no') ?? "No phone provided",
      };
      return data;
    }   
    DocumentSnapshot shopSnapshot =
        await FirebaseFirestore.instance.collection("shop").doc(userId).get();

    if (shopSnapshot.exists) {
      Map<String, dynamic> data = {
        "name": shopSnapshot.get('Shop name:') ?? "No shop name provided",
        "address": shopSnapshot.get('shop address') ?? "No address provided",
        "phone": shopSnapshot.get('phone number') ?? "No phone provided",
      };
      return data;
    }

    // If no details found, return null
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("payment").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          }

          final payments = snapshot.data!.docs;
          final userPayments = payments.where((payment) {
            return userName != null &&
                payment['paid to'] ==
                    userName; // Check for matching designer name
          }).toList();

          if (userPayments.isEmpty) {
            return Center(child: Text("No payments found for user: $userName"));
          }

          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: userPayments.length,
              itemBuilder: (context, index) {
                final payment =
                    userPayments[index]; // Access each payment document

                String dressSizeString = payment['size'];

                String image = payment['image'];
                String paidFrom =
                    payment['paid from']; // The user ID of the order placer

                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: image == ""
                                              ? const AssetImage(
                                                      "assets/60b6980613b92e7b9913f40d32a59bc7.jpg")
                                                  as ImageProvider
                                              : NetworkImage(image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Size",
                                                style: GoogleFonts.pacifico(
                                                    color: Colors.pink,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                dressSizeString,
                                                style: GoogleFonts.pacifico(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "${payment['price']} rupees paid successfully",
                                            style: GoogleFonts.pacifico(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(height: 40),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      side: const BorderSide(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
                                                          Color.fromARGB(255,
                                                              252, 158, 189)),
                                                ),
                                                onPressed: () async {
                                                  Map<String, dynamic>? datas =
                                                      await getOrderPersonDetails(
                                                          paidFrom);

                                                  // Fetch order person's details based on 'paid from' field
                                                  // Map<String, dynamic>? orderPersonDetails =
                                                  //     await getOrderPersonDetails(paidFrom);

                                                  // Show bottom sheet with the fetched details
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return SizedBox(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ListTile(
                                                                tileColor:
                                                                    Colors.pink,
                                                                leading:
                                                                    const Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                title: Text(
                                                                  datas?[
                                                                      'name'], // Display user/shop name
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              const Divider(
                                                                  color: Colors
                                                                      .white),
                                                              ListTile(
                                                                leading:
                                                                    const Icon(
                                                                  Icons
                                                                      .location_on_sharp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                tileColor:
                                                                    Colors.pink,
                                                                title: Text(
                                                                  datas?[
                                                                      'address'],
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              const Divider(
                                                                  color: Colors
                                                                      .white),
                                                              ListTile(
                                                                leading:
                                                                    const Icon(
                                                                  Icons.phone,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                tileColor:
                                                                    Colors.pink,
                                                                title: Text(
                                                                  datas?[
                                                                      'phone'],
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 40),
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  shape:
                                                                      MaterialStatePropertyAll(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                      side: const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              250,
                                                                              154,
                                                                              186)),
                                                                    ),
                                                                  ),
                                                                  backgroundColor:
                                                                      MaterialStatePropertyAll(
                                                                          Colors
                                                                              .pink[100]),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  "Done",
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  "Detail",
                                                  style:
                                                      GoogleFonts.inknutAntiqua(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
