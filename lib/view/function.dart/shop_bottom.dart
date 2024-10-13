


import 'package:flutter/material.dart';
import 'package:login/view/Shop/ShopHome.dart';
import 'package:login/view/Shop/request.dart';
import 'package:login/view/Shop/shopPrrofile.dart';
import 'package:login/view/Shop/shopUpload.dart';


class ShopBottom extends StatefulWidget {
   int indexnum=0;
   ShopBottom({super.key,required this.indexnum});

  @override
  State<ShopBottom> createState() => _ShopBottomState();
}

class _ShopBottomState extends State<ShopBottom> {
 final _pages=[
    
    const ShopHome(),
    // const ShopUpload(),
    const Request(),
    const ShopProfile()
    
    
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
      //  BottomNavigationBarItem(icon: const Icon(Icons.file_upload_rounded),label: "Upload",
      // backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.content_paste_search_outlined),label: "Request",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
      backgroundColor: Colors.grey[850],)
      
    ]);
    

}

   