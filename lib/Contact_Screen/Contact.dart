import 'dart:io';

import 'package:contacts/Contact_Screen/Add_Contact.dart';
import 'package:contacts/contact_model.dart';
import 'package:flutter/material.dart';

List<ContactModel> ContactList = [
  ContactModel(
      name: 'Darshan', num: '9904177670'),
  ContactModel(
      name: 'Prince', num: '9725381787'),
  ContactModel(
      name: 'Vivek', num: '9106619178'),
  ContactModel(name: 'jio', num: '1900'),
  ContactModel(
      name: 'Bhargava',
      num: '9898637200',
     ),
];

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Contacts",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey[300],
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/my.jpg"),
                        radius: 20,
                      ),
                    ),
                    title: Text(
                      'Kaushik Hadiya',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    subtitle: Text(
                      "9313977271",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Contacts",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ContactTile(ContactList[index],index);
                  },
                  itemCount: ContactList.length,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: '00+',
            onPressed: () {
              Navigator.pushNamed(context, 'Add').then((value) {
                setState(() {});
              });
            },
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 30,
              ),
            )),
      ),
    );
  }

  Widget ContactTile(ContactModel c,int index) {
    return InkWell(onTap: () {
      Navigator.pushNamed(context, 'View',arguments: index).then((value) {
        setState(() {

        });
      });
    },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: c.img == null
                  ? CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/person_icon.png"),radius: 30,)
                  : CircleAvatar(
                      backgroundImage:
                          FileImage(File('${c.img}')),radius: 35,)),
          title: Text("${c.name}"),
          subtitle: Text("${c.num}"),
        ),
      ),
    );
  }
}
