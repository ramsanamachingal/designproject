import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/view/Shop/shopUpload.dart';

class ShopVideeo extends StatefulWidget {
  const ShopVideeo({super.key});

  @override
  State<ShopVideeo> createState() => _ShopVideeoState();
}

class _ShopVideeoState extends State<ShopVideeo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/14d10a90437927d9d2607b6d658c992f.mp4"),fit: BoxFit.cover)),
              );
            }
            ,itemCount: 10,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopUpload()));
      },child: const Icon(Icons.add,color: Colors.pink,),),
    );
  }
}