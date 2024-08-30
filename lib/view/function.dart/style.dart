
// import 'package:flutter/material.dart';
// import 'package:login/view/user/designers.dart';
// import 'package:login/view/user/home.dart';
// import 'package:login/view/user/profile.dart';

// class UserBottomnaviPage extends StatefulWidget {
//   int indexnum = 0;

//   UserBottomnaviPage({super.key, required this.indexnum});

//   @override
//   State<UserBottomnaviPage> createState() => _UserBottomnaviPageState();
// }

// class _UserBottomnaviPageState extends State<UserBottomnaviPage> {
//   final _pages = [
//     const HomePage(),
//     const Designers(),
//     const Profile(),
    
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[widget.indexnum],
//       bottomNavigationBar: myNav(
//         index: widget.indexnum,
//         onTap: (index) {
//           setState(() {
//             widget.indexnum = index;
//           });
//         },
//       ),
//     );
//   }
// }

// Widget myNav({
//   int? index,
//   void Function(int)? onTap,
//   selectedcolor,
// }) {
//   return BottomNavigationBar(
//     showUnselectedLabels: true,
//     currentIndex: index!,
//     selectedItemColor: Colors.pink,
//     unselectedItemColor: Colors.black,
//     showSelectedLabels: true,
//     onTap: onTap,
//     items: const [
//       BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//           backgroundColor: Color(0xffB7B7B7)),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Search',
//           backgroundColor: Color(0xffB7B7B7)),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.notifications_active),
//         label: 'Notification',
//         backgroundColor: Color(0xffB7B7B7),
//       ),
     
      
//     ],
//   );
// }


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

   