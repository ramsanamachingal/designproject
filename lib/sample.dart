import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/Service/class.dart';
FireStore obj=FireStore();
FirebaseFirestore i=FirebaseFirestore.instance;
class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
    final nameController=TextEditingController();
    final agecontroller=TextEditingController();
    final coursecontroller=TextEditingController();


 
  @override

  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        leading: const Text("sample"),
        bottom: const PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: i.collection('username').snapshots(),
        builder: (context, snapshot) {
          

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No user profiles found'));
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userData =
                  users[index].data() as Map<String, dynamic>;
              final userName = userData['name'];
              final userid=users[index].id;

              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(tileColor: Colors.pink,
                  title: Text(userName),
                  trailing: 
                
                      // IconButton(onPressed: () {
                      //   obj.deleteUser(userid);
                      // },icon: const Icon(Icons.delete),),
                      IconButton(onPressed: (){
                        obj.update(userid,nameController.text);
                      }, icon: const Icon(Icons.edit))
                 
                  ),
                  );
                  });
                  }),
       floatingActionButton:  FloatingActionButton(onPressed: (){
         showDialog(context: context,builder:(BuildContext context){
           return AlertDialog(content: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
                 ),
                 TextFormField(
                  controller: agecontroller, 
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),),
                  TextFormField(
                  controller: coursecontroller, 
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),)
               ],
             ),
           ),
           actions: [ElevatedButton(onPressed: (){
            obj.saveData(nameController.text,agecontroller.text,coursecontroller.text);
            nameController.clear();
            Navigator.pop(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Sample()));
           }, child: const Text("Save")
           )
           ],);
         }
         );
       
       
       },
       child: const Icon(Icons.add_circle),),
    );
  }
}