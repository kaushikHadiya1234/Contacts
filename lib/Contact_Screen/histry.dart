import 'dart:io';

import 'package:contacts/contact_model.dart';
import 'package:flutter/material.dart';

List<ContactModel> HistryList = [
  ContactModel(name: 'Darshan', num: '9904177670'),
  ContactModel(name: 'Prince', num: '9725381787'),
];

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Text(
                      "All",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    child: Text(
                      "Missed",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContactTile(HistryList[index], index);
                },
                itemCount: HistryList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ContactTile(ContactModel c, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'View', arguments: index).then((value) {
          setState(() {});
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
                          AssetImage("assets/images/person_icon.png"),
                      radius: 30,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(File('${c.img}')),
                      radius: 35,
                    )),
          title: Text("${c.name}"),
          subtitle: Text("${c.num}"),
        ),
      ),
    );
  }
}
