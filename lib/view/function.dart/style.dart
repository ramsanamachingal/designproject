

import 'package:flutter/material.dart';

import 'package:login/view/user/designers.dart';
import 'package:login/view/user/home.dart';
import 'package:login/view/user/profile.dart';

class packages extends StatefulWidget {
   int indexnum=0;
   packages({super.key,required this.indexnum});

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
 final _pages=[
    
    const HomePage(),
    const Designers(),
    const Profile(),
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
  body: _pages[widget.indexnum],
      bottomNavigationBar:mynav(
        index:widget.indexnum,
        onTap:(index){
        setState(() {
          widget.indexnum=index;
        });
      }
        )

    );
  }
}
Widget mynav({
  int? index,
  void Function(int)?onTap,
  selectedcolor,
})
{
  return BottomNavigationBar(
    type: BottomNavigationBarType.shifting,
    showUnselectedLabels: true,
    currentIndex: index!,
    selectedItemColor: Colors.pink,
    unselectedItemColor: Colors.white,
    showSelectedLabels: true,
    onTap: onTap ,
    items: [
      BottomNavigationBarItem(icon: const Icon(Icons.home),label: "Home",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person_search),label: "Designers",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person_2_sharp),label: "Profile",
      backgroundColor: Colors.grey[850],),
      //  BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
      // backgroundColor: Colors.grey[850],)
      
    ]);
    

}

   