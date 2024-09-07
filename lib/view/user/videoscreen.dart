import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // no. of columns
          crossAxisSpacing: 10, // Space b/w columns
          mainAxisSpacing: 10, // Space b/w  rows
          childAspectRatio: 1 / 1.5, //  width/height
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/3ac3918cfaf664a2e3bc40833621cc5e.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8), 
              
            ),
          );
        },
        itemCount: 20, 
      ),
    );
  }
}
