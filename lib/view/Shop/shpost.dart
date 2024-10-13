import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/Shop/shopUpload.dart';

class ShopPost extends StatefulWidget {
  const ShopPost({super.key});

  @override
  State<ShopPost> createState() => _ShopPostState();
}

class _ShopPostState extends State<ShopPost> {
  final currentuid=FirebaseAuth.instance.currentUser!.uid;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: fire.collection('ShopDress').doc(currentuid).collection('shdress').snapshots(),
        builder: (context, snapshot) {
          final alldrs=snapshot.data!;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1/1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context,index){
                 var dressData = alldrs.docs[index].data() as Map<String, dynamic>;
                    String imageUrl = dressData['image'];
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
            ),
          );
              }
              ,itemCount: alldrs.docs.length,
              );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopUpload()));
      },child: const Icon(Icons.add,color: Colors.pink,),),
    );
  }
}
