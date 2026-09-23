import 'dart:convert';

import 'package:app_mercadinho/navigation/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGestao extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaGestao> createState() => _TelaGestaoState();
}

class _TelaGestaoState extends State<TelaGestao> {
  TextEditingController nomeDigitado = TextEditingController(); 
  TextEditingController urlDigitada = TextEditingController();
  TextEditingController precoDigitado = TextEditingController();
  
  void fazerPost() async {
    final respostaServidor = await http.post(Uri.parse("https://mercadinho-api-hhi8.onrender.com/produtos"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode({
    "nome": nomeDigitado.text, 
    "imagem":urlDigitada.text, 
    "preco":double.parse(precoDigitado.text),
    })
    );
    if(mounted){
        if(respostaServidor.statusCode == 201){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dado criado com Sucesso championzinho"))
      );
      Navigator.push(context,MaterialPageRoute(builder: (context)=>NavBar()));
    }else{
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao criar dado championzinho 🚀🤣"))
      );
    }
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Tela Gestão"),backgroundColor: Colors.orange),
      body:ListView(
        children: [
          TextField(controller:nomeDigitado, decoration: InputDecoration(hintText: "Digite o nome do produto"),),
          TextField(controller:urlDigitada, decoration: InputDecoration(hintText: "Digite a url da imagem"),),
          TextField(controller:precoDigitado, decoration: InputDecoration(hintText: "Digite o preco do Produto"),),
          TextButton(onPressed: ()=>fazerPost(), child: Text("Salvar"))
        ],
      )

    );
  }
}