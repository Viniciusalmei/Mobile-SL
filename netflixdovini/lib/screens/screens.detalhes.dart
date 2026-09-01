import 'package:flutter/material.dart';

class DetalhesFilme extends StatefulWidget {
  String filme;
  DetalhesFilme({super.key, required this.filme});

  @override
  State<DetalhesFilme> createState() => _DetalhesFilmeState();
}

class _DetalhesFilmeState extends State<DetalhesFilme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Detalhes")),
      body:Center(child:Column(children:[
        Image.network(widget.filme.split("|")[1],width: 100),
        Text(widget.filme.split("|")[0]),
        Text(widget.filme.split("|")[2]),
        Text(widget.filme.split("|")[3]),
      ]))
    );
  }
}