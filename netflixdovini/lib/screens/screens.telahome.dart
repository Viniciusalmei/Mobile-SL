import 'package:flutter/material.dart';
import 'package:netflixdovini/screens/screens.detalhes.dart';
import 'package:netflixdovini/screens/screens.novofilme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String? email; //pode ser nulo 
  String? senha;
  List<String> filmes = [];

  void carregarDados() async {
    dynamic banco = await SharedPreferences.getInstance();
    setState(() {
      email = banco.getString("email") ?? "Nao foi logado";
      filmes = banco.getStringList("filmes") ?? [];
      //Caso nao tenha nada no banco, a variavel fica vazia 
      //isso evita de ficar null
    });
  }

  void deletarDados(String filme) async {
    dynamic banco = await SharedPreferences.getInstance();
    setState(() {
      filmes.remove(filme);
    });
    await banco.setStringList("filmes", filmes);
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      TextButton(style:TextButton.styleFrom(foregroundColor: Colors.white) ,onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>NovoFilme()));
      }, child: Icon(Icons.add)),
      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqNC1qkPr07dpqC-tj6TsVkVbxGXY5n62pKXoNZnw5Zg&s=10",width: 100),
      Text("$email",style:TextStyle(color: Colors.white))
      ],
      ),
      backgroundColor:Colors.black,
      automaticallyImplyLeading: false,
      ),
      body: filmes.isEmpty ? Center(child:Text("Não há filmes cadastrados")) :
      GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        for(String filme in filmes)
          Column(children: [
          GestureDetector(
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>DetalhesFilme(filme: filme)));
            },
            child:Image.network(filme.split("|")[1],width: 100),
          ),
          Text(filme.split("|")[0]),
          TextButton(onPressed:()=>deletarDados(filme),child:Text("Deletar"))
        ],)
      ],
      )
    );
  }
}