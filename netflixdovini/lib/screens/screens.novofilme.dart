import 'package:flutter/material.dart';
import 'package:netflixdovini/screens/screens.telahome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NovoFilme extends StatefulWidget {
  const NovoFilme({super.key});

  @override
  State<NovoFilme> createState() => _NovoFilmeState();
}

class _NovoFilmeState extends State<NovoFilme> {
  //Codamos a lógica Aqui 🚀
  TextEditingController titulo = TextEditingController();
  TextEditingController imagem = TextEditingController();
  TextEditingController ano = TextEditingController();
  TextEditingController genero = TextEditingController();
  
  // List<String> filmes = []; //Lista que só aceita string

  void salvarFilme() async {
    dynamic banco = await SharedPreferences.getInstance();
    List<String> filmes = banco.getStringList("filmes") ?? [];
    setState(() {
      String filme = "${titulo.text}|${imagem.text}|${ano.text}|${genero.text}";
      filmes.add(filme);
    });
    await banco.setStringList("filmes",filmes);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Filme Cadastrado com Sucesso"))
    );
    Navigator.push(context,MaterialPageRoute(builder: (context)=> TelaHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Filme",style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
      body: Column(children: [
        TextField(controller:titulo,decoration: InputDecoration(labelText: "Insira o seu titulo")),
        TextField(controller:imagem,decoration: InputDecoration(labelText: "Insira a sua imagem")),
        TextField(controller:ano,decoration: InputDecoration(labelText: "Insira o seu ano")),
        TextField(controller:genero,decoration: InputDecoration(labelText: "Insira o seu genero")),
        TextButton(onPressed: salvarFilme, child: Text("Salvar"))
      ],)
    );
  }
}