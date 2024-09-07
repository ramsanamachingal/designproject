import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Admin/Adhome.dart';
import 'package:login/firebase_options.dart';
import 'package:login/test/samplemodel.dart';
import 'package:login/view/Auth/page1.dart';

import 'package:login/view/function.dart/des_bottom.dart';


Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage()
    );
  }
}