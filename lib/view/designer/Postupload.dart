import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Admin/adDesign.dart';
import 'package:login/view/designer/upload.dart';
import 'package:login/view/user/edit.dart';


class PostUpload extends StatefulWidget {
  const PostUpload({super.key});

  @override
  State<PostUpload> createState() => _PostUploadState();
}

class _PostUploadState extends State<PostUpload> {
  final currenid=FirebaseAuth.instance.currentUser!.uid;
  String? imageUrl;
  @override
  

  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StreamBuilder(
        
        stream: fire.collection('DesignerDress').doc(currenid).collection('dress').snapshots(),
        builder: (context, snapshot) {
            final alldrs=snapshot.data!;
         print(alldrs.docs.length);
         print(';;;;;;;;;;;;;;;;;;;;;');
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var dressData = alldrs.docs[index].data() as Map<String, dynamic>;
                String imageUrl = dressData['image'];
                return Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: 
                          
                          NetworkImage(imageUrl),
                              fit: BoxFit.cover)),
                );
              }
              ,itemCount: alldrs.docs.length,);
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const DesignerUpload()));
      },child: const Icon(Icons.add,color: Colors.pink,),),
    );
  }
}
