
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     backgroundColor: commonScaffoldBack,
     // Add a ListView to the drawer. This ensures the user can scroll
     // through the options in the drawer if there isn't enough vertical
     // space to fit everything.
     child: ListView(
       // Important: Remove any padding from the ListView.
       padding: EdgeInsets.zero,
       children: [
         ListTile(
           title: const Text('Item 1'),
           onTap: () {
             // Update the state of the app
             // ...
             // Then close the drawer
             Navigator.pop(context);
           },
         ),
         ListTile(
           title: const Text('Item 2'),
           onTap: () {
             // Update the state of the app
             // ...
             // Then close the drawer
             Navigator.pop(context);
           },
         ),
         ListTile(
           title: const Text('Item 2'),
           onTap: () {
             // Update the state of the app
             // ...
             // Then close the drawer
             Navigator.pop(context);
           },
         ),
       ],
     ),
      );
  }
}