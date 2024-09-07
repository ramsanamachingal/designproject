import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Shop/ShProductdetail.dart';
import 'package:login/view/Shop/shdesignerProduct.dart';

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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.pink,
          ),
        ),
        title:  Text("Home", style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              color: Colors.pink,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Offers",
                  style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 1.0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                        // child: Center(child: Text("Item $index"),),
                      );
                    }),
              ),
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
                height: 200,
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
                                    builder: (context) => const ShDesignerProduct()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              "assets/60b6980613b92e7b9913f40d32a59bc7.jpg",
                            ))),
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
                height: 200,
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
                                  builder: (context) => const ShProductDetail()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/60b6980613b92e7b9913f40d32a59bc7.jpg"))),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
