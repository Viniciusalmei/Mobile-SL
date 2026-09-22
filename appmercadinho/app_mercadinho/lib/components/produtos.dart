import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  String nome;
  String urlImagem;
  double preco;

  Produtos({super.key, required this.nome, required this.urlImagem, required this.preco});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image.network(urlImagem,width: 100,height: 100),
        Text(nome,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Text("R\$ ${preco.toStringAsFixed(2)}") //R$ 30.00
      ],)
    );
  }
}