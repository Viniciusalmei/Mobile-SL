import 'dart:convert';
import 'package:app_mercadinho/components/produtos.dart';
import 'package:app_mercadinho/screens/telagestao.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaHome extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  //Aqui vamos codar a nossa lógica 
  List listaProdutos = [];

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    //Variavel final é uma variavel que começa sem valor e depois 
    //recebe.
    //é muito utilizada para respostas de API/Servidor e banco de dados.
    final respostaServidor = await http.get(Uri.parse("https://mercadinho-api-hhi8.onrender.com/produtos"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
      listaProdutos = dados;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Icon(Icons.list, color: Colors.white),
          IconButton(onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>TelaGestao()));
          },icon:Icon(Icons.settings),color: Colors.white)
        ],),
        automaticallyImplyLeading: false,
      ),
      body: listaProdutos.isEmpty ? Center(child:Text("Carregando Produtos")) :
      GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
      for(final produto in listaProdutos)
      Produtos(nome: produto["nome"], urlImagem: produto["imagem"], preco: produto["preco"])
      ],
      )  
    );
  }
}
