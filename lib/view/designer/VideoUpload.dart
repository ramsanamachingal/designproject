import 'package:flutter/material.dart';
import 'package:login/view/designer/upload.dart';


class VideoUpload extends StatefulWidget {
  const VideoUpload({super.key});

  @override
  State<VideoUpload> createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
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
                            "assets/35cff69400a0854be6d3e79e11f2da11.jpg"),fit: BoxFit.cover)),
              );
            }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const DesignerUpload()));
      },child: const Icon(Icons.add,color: Colors.pink,),),
    );
  }
}