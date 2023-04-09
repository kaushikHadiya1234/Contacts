import 'package:contacts/Contact_Screen/histry.dart';
import 'package:contacts/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dialpad extends StatefulWidget {
  const Dialpad({Key? key}) : super(key: key);

  @override
  State<Dialpad> createState() => _DialpadState();
}

class _DialpadState extends State<Dialpad> {
  bool Clear = false;
  String n = '';
  List l1 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            Expanded(child: Container()),
            Container(
              height: 60,
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '$n',
                        style: TextStyle(fontSize: 40,overflow: TextOverflow.ellipsis),
                        textAlign:TextAlign.right,
                        maxLines: 1,
                      ),
                    ),
                    InkWell(onTap: () {
                      setState(() {
                        n='';
                      });
                    },
                        child: Icon(Icons.backspace)),
                  ],
                ),
              ),
            ),
            Container(
                height: 400,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 90),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          n += "${l1[index]}";
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "${l1[index]}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                  itemCount: l1.length,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await launchUrl(Uri.parse('tel:${n}'));
            ContactModel cm=ContactModel(name: 'Unknown',num: n);

            setState(() {
              HistryList.add(cm);
              n = '';
            });
          },
          child: Icon(
            Icons.call,
            size: 30,
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
