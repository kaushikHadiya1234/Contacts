import 'package:flutter/material.dart';

class Splace extends StatefulWidget {
  const Splace({Key? key}) : super(key: key);

  @override
  State<Splace> createState() => _SplaceState();
}

class _SplaceState extends State<Splace> {
  @override
  Widget build(BuildContext context) {
   Future.delayed(Duration(seconds: 2), () =>  Navigator.pushReplacementNamed(context, '/'));
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
            width: double.infinity
            ,child: Image.asset("assets/images/splace.jpg",fit: BoxFit.fill,)),
      ),
    );
  }
}
