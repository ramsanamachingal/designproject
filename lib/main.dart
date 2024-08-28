import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/firebase_options.dart';
import 'package:login/view/Shop/ShopHome.dart';
import 'package:login/view/Shop/request.dart';
import 'package:login/view/Shop/shopPrrofile.dart';
import 'package:login/view/Shop/shopUpload.dart';
import 'package:login/view/designer/DesProfile.dart';
import 'package:login/view/designer/deshom.dart';
import 'package:login/view/designer/order.dart';
import 'package:login/view/designer/upload.dart';
import 'package:login/view/designer/vaccancies.dart';
import 'package:login/view/user/create.dart';
import 'package:login/view/first/login.dart';
import 'package:login/view/first/page1.dart';

import 'package:login/view/first/signup.dart';
import 'package:login/view/user/designers.dart';
import 'package:login/view/user/profile.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopProfile (),
    );
  }
}