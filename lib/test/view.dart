import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/test/model.dart';

class SampleView extends StatefulWidget {
  const SampleView({super.key});

  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("student").snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return const Center(
                  child: Text("No data found"),
                );
              }
              final students=snapshot.data!.docs.map((doc){
                  return ModelSample(name: doc["Name"], age: doc["Age"],course: doc["Course"]);
          
                }).toList();
              return ListView.builder(
               itemCount: students.length, 
                itemBuilder: (context,index){
                
                final num=students[index];
                return ListTile(
                  title:Text(num.name)
                );
              });
            }));
  }
}
