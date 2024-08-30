import 'package:flutter/material.dart';

class Adhome extends StatefulWidget {
  const Adhome({super.key});

  @override
  State<Adhome> createState() => _AdhomeState();
}

class _AdhomeState extends State<Adhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      
     // bottom: TabBar(tabs: ),
      ),
    );
  }
}