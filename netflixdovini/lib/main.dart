import 'package:flutter/material.dart';
import 'package:netflixdovini/screens/screens.telalogin.dart';

void main() {
  runApp(const MyApp());
}

//Classe de configuração /gerenciamento 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin()
    );
  }
}