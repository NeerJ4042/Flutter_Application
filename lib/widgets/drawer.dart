 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  String profileURL = "https://media-exp1.licdn.com/dms/image/C4D03AQEZ41TFU1XMwg/profile-displayphoto-shrink_200_200/0/1623022901871?e=1645660800&v=beta&t=4rzQcFgga2edIwUe1LbLJT7Sev8g0Xrc3hcUpYvhY9E";
  @override
  Widget build(BuildContext context) {
    return Drawer(
         child: Container(
           color: Colors.blue,
           child: ListView(
             padding: EdgeInsets.zero,
             children: [
               DrawerHeader(
                 padding: EdgeInsets.zero,
                   child: UserAccountsDrawerHeader(
                     accountName: Text("Neer Thummar", style: TextStyle(fontSize: 14),),
                     accountEmail: Text("neer.thummar@gmail.com",style: TextStyle(fontSize: 14),),
                     currentAccountPicture: CircleAvatar(
                       backgroundImage: NetworkImage(profileURL),
                     ),
                   ),
               ),
               ListTile(
                 leading: Icon(CupertinoIcons.home, color: Colors.white,),
                 title: Text("Home", style: TextStyle(
                   fontSize: 16
                 ),),
               ),

               ListTile(
                 leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
                 title: Text("Profile", style: TextStyle(
                     fontSize: 16
                 ),),
               ),

               ListTile(
                 leading: Icon(CupertinoIcons.mail, color: Colors.white,),
                 title: Text("Email us", style: TextStyle(
                     fontSize: 16
                 ),),
               )
             ],
           ),
         ),
    );
  }

}