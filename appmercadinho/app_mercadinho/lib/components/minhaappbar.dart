import 'package:app_mercadinho/navigation/navbar.dart';
import 'package:flutter/material.dart';

class MinhaAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orange,
      title: Row(children: [
        IconButton(onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>NavBar())), icon: icon)
      ],),
    );
  }
}