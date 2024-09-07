import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/test/model.dart';
import 'package:login/test/view.dart';


class SampleModel extends StatefulWidget {
  const SampleModel({super.key});

  @override
  State<SampleModel> createState() => _SampleModelState();
}

class _SampleModelState extends State<SampleModel> {
  
  final nameController=TextEditingController();
  final ageController=TextEditingController();
final courseController=TextEditingController();
 Future addStudent()async{
  String a=nameController.text;
  String b=ageController.text;
  String c=courseController.text;
ModelSample sample=ModelSample(name: a, age: b,course: c);
FirebaseFirestore.instance.collection("student").add(sample.toMap());
Navigator.push(context, MaterialPageRoute(builder: (context)=>const SampleView()));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: courseController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              addStudent();
              
            }, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
