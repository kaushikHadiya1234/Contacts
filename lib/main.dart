import 'package:contacts/Contact_Screen/Add_Contact.dart';
import 'package:contacts/Contact_Screen/Home_Screen.dart';
import 'package:contacts/Contact_Screen/Splace.dart';
import 'package:contacts/Contact_Screen/View_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splace',
      routes: {
        '/':(context) => HomeScreeen(),
        'Add':(context) => AddContact(),
        'View':(context) => ViewScreen(),
        'splace':(context) => Splace(),
      },
    ),
  );
}
