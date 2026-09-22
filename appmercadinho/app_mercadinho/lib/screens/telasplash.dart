import 'package:app_mercadinho/navigation/navbar.dart';
import 'package:app_mercadinho/screens/telahome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Aqui codamos a lógica 
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds:3),
      ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>NavBar()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuiVkzgOd2TMjY92ehobXMtUWEB_cbyBj9hh8vDRtU-Bb5SZNhlAXzH_k&s=10",width: 100),
          CircularProgressIndicator(color: Colors.orange)
        ],
      ))
    );
  }
}


