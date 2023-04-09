import 'dart:io';
import 'package:contacts/Contact_Screen/Add_Contact.dart';
import 'package:contacts/Contact_Screen/Contact.dart';
import 'package:contacts/Contact_Screen/histry.dart';
import 'package:contacts/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "< Contacts",
                      style: TextStyle(fontSize: 27, color: Colors.blue),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Edit contact",
                                  style: TextStyle(color: Colors.black),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        children: [
                                          path == null
                                              ? Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/person_icon.png"),
                                            ),
                                          )
                                              : Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                            child: CircleAvatar(
                                              backgroundImage:
                                              FileImage(File('$path')),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          'Take Photo',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                              Colors.blue),
                                                        ),

                                                        content: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  ImagePicker
                                                                  imagepicker =
                                                                  ImagePicker();
                                                                  XFile? xfile =
                                                                  await imagepicker.pickImage(
                                                                      source:
                                                                      ImageSource.camera);
                                                                  setState(() {
                                                                    path = xfile!
                                                                        .path;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .camera_alt_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                )),
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  ImagePicker
                                                                  imagepicker =
                                                                  ImagePicker();
                                                                  XFile? xfile =
                                                                  await imagepicker.pickImage(
                                                                      source:
                                                                      ImageSource.gallery);
                                                                  setState(() {
                                                                    path = xfile!
                                                                        .path;
                                                                    print("============ $path========");
                                                                    Navigator.pop(context);
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.photo,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                )),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(15),
                                        height: 50,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter the Name";
                                            }
                                          },
                                          controller: txtname =
                                              TextEditingController(
                                                  text:
                                                      "${ContactList[index].name}"),
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            label: Text(
                                              'Name',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(15),
                                        height: 50,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter the Number";
                                            }
                                          },
                                          controller: txtnum =
                                              TextEditingController(
                                                  text:
                                                      "${ContactList[index].num}"),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            label: Text(
                                              'Phone',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      FloatingActionButton.extended(
                                        onPressed: () {
                                          setState(() {
                                            ContactList[index].name =
                                                txtname.text;
                                            ContactList[index].num = txtnum.text;
                                            ContactList[index].img=path;
                                            Navigator.pop(context);
                                          });
                                        },
                                        label: Text("Submit"),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit_square,
                          color: Colors.blue,
                          size: 27,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              Stack(
                alignment: Alignment(0, -1.3),
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "${ContactList[index].name}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${ContactList[index].num}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      'sms:${ContactList[index].num}'));
                                },
                                heroTag: '1',
                                child: Icon(Icons.message),
                              ),
                              FloatingActionButton(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      'tel:${ContactList[index].num}'));
                                 setState(() {
                                   HistryList.add(ContactList[index]);
                                 });
                                },
                                heroTag: '1',
                                child: Icon(Icons.call),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                heroTag: '1',
                                child: Icon(Icons.video_call),
                              ),
                              FloatingActionButton(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      'mailto: kaushikhadiya5@gmail'));
                                },
                                heroTag: '1',
                                child: Icon(Icons.mail_outline),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: ContactList[index].img == null
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person_icon.png"))
                          : CircleAvatar(
                              backgroundImage: FileImage(File('${path}')))),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {}, child: Text("Send Whatsapp Message")),
                    Divider(height: 2),
                    TextButton(
                        onPressed: () {
                          Share.share(
                              '${ContactList[index].name}\n${ContactList[index].num}');
                        },
                        child: Text("Share Contact")),
                    Divider(height: 2),
                    TextButton(
                        onPressed: () {}, child: Text("Add to Favourites")),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          ContactList.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Delete Contact",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Block Contact",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

