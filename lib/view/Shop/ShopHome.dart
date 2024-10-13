import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/view/Shop/ShProductdetail.dart';
import 'package:login/view/Shop/shdesignerProduct.dart';
import 'package:login/view/Shop/shopdrawer.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({super.key});

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.pink,
          //   ),
          // ),
          title: Text(
            "Home",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Divider(
                color: Colors.pink,
              )),
        ),
        drawer: const ShopDrawer(),
        body: SingleChildScrollView(
            child: Column(
          children: [
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
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      List alldress = snapshot.data;

                      return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          // ignore: prefer_const_constructors
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 1.0,
                          ),
                          itemCount: alldress.length,
                          itemBuilder: (context, index) {
                            final Map<dynamic, dynamic> singleDress =
                                alldress[index] as Map<dynamic, dynamic>;
                            String imageUrl = singleDress['image'];
                            String dressid = singleDress['id'];
                            String userid = singleDress['userid'];
                            String name = singleDress['name'];
                            String price = singleDress['price'];

                            return GestureDetector(
                              onTap: () {
                                print(dressid);
                                print(userid);
                                print(';;;;;;;;;;;;;;;;;;;;;;');
                                print('.................................');

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShDesignerProduct(
                                            dressId: dressid, userid: userid)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageUrl == ''
                                            ? AssetImage(
                                                    "assets/5ff089db70274bdaa8584427fbb72ec5.jpg")
                                                as ImageProvider
                                            : NetworkImage(imageUrl),
                                        fit: BoxFit.cover)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      name,
                                      style: GoogleFonts.pacifico(
                                        color: Colors.white,
                                        fontSize: 25,
                                          shadows: [
                                          const Shadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Text(
                                      price,
                                      style: GoogleFonts.pacifico(
                                          color: Colors.white, fontSize: 25,
                                            shadows: [
                                          const Shadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]
                                          ),
                                    )
                                  ],
                                ),
                                //child: Center(child: Text("item $index"),),
                              ),
                            );
                          });
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
              height: 300,
              child: FutureBuilder(
                  future: fetchDataShop(),
                  builder: (context, snapshot) {
                    List allshopDress = snapshot.data;
                    return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: allshopDress.length,
                        itemBuilder: (context, index) {
                          final Map<dynamic, dynamic> singledress =
                              allshopDress[index] as Map<dynamic, dynamic>;
                          String imageUrl = singledress['image'];
                          String dressid = singledress['id'];
                          String userid = singledress['userid'];
                          String name = singledress['name'];
                          String price = singledress['price'];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShProductDetail(
                                          dressId: dressid, userid: userid)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageUrl == ''
                                          ? AssetImage(
                                                  "assets/60b6980613b92e7b9913f40d32a59bc7.jpg")
                                              as ImageProvider
                                          : NetworkImage(imageUrl),
                                      fit: BoxFit.cover)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    name,
                                    style: GoogleFonts.pacifico(
                                      color: Colors.white,
                                      fontSize: 25,
                                        shadows: [
                                          const Shadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                  ),
                                  Text(
                                    price,
                                    style: GoogleFonts.pacifico(
                                        color: Colors.white,
                                        fontSize: 25,
                                        shadows: [
                                          const Shadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),SizedBox(height: 20,)
          ],
        )));
  }

  Future fetchData() async {
    print('0000000000000000000000000000000000000000000000');
    List ab = [];
    QuerySnapshot snapshotp =
        await FirebaseFirestore.instance.collectionGroup('dress').get();
    for (var doc in snapshotp.docs) {
      Map data = {
        "name": doc['Dress name'],
        "image": doc['image'],
        "price": doc['price'],
        "id": doc.id,
        "userid": doc['id']
      };
      print(';;;;;;;;;;;;;;;;;;;;;;;;;;;');
      ab.add(data);
    }
    print(ab);
    print(snapshotp.docs.isEmpty);
    print(snapshotp.docs.length);
    print(snapshotp.docs.toList());
    return ab;
  }

  Future fetchDataShop() async {
    List l = [];
    QuerySnapshot snapshotshp =
        await FirebaseFirestore.instance.collectionGroup('shdress').get();
    for (var doc in snapshotshp.docs) {
      Map shopdata = {
        "name": doc['Dress name'],
        "image": doc['image'],
        "price": doc['price'],
        "id": doc.id,
        "userid": doc['id']
      };
      l.add(shopdata);
    }
    return l;
  }
}
