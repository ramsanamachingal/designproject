


import 'package:flutter/material.dart';
import 'package:login/view/designer/DesProfile.dart';
import 'package:login/view/designer/deshom.dart';
import 'package:login/view/designer/order.dart';


class DesignerBottom extends StatefulWidget {
   int indexnum=0;
   DesignerBottom({super.key,required this.indexnum});

  @override
  State<DesignerBottom> createState() => _DesignerBottomState();
}

class _DesignerBottomState extends State<DesignerBottom> {
 final _pages=[
    
    const DesignerHome(),
    
    const OrderProduct(),
    const ProfileDesigner()
    
    
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
      
       BottomNavigationBarItem(icon: const Icon(Icons.pending_actions_outlined),label: "Order",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
      backgroundColor: Colors.grey[850],)
      
    ]);
    

}

   