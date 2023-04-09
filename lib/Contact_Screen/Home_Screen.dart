import 'package:contacts/Contact_Screen/Contact.dart';
import 'package:contacts/Contact_Screen/Dialpad.dart';
import 'package:contacts/Contact_Screen/histry.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({Key? key}) : super(key: key);

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  int i=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: i,
          children: [
            Contact(),
            Dialpad(),
            history()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          currentIndex: i,
          selectedItemColor: Colors.blue,
          elevation: 0,
          onTap: (value) {
            setState(() {
              i=value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dialpad,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
