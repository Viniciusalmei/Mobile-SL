import 'package:app_mercadinho/screens/telahome.dart';
import 'package:app_mercadinho/screens/telaperfil.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const new({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //Aqui here eu I codo codo minha my logica logic 
  int indexAtual = 0; 

  void mudarIndex(int novoIndex){
    setState(() {
      indexAtual = novoIndex;
    });
  }

  List paginas = [
    TelaHome(),
    TelaPerfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:paginas.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label:"Home",icon:Icon(Icons.home)),
        BottomNavigationBarItem(label:"Perfil",icon:Icon(Icons.person))
      ],
      currentIndex: indexAtual,
      onTap: mudarIndex,
      backgroundColor: Colors.orange,
      selectedItemColor: Colors.white,
      )
    );
  }
}