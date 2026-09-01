    import 'package:flutter/material.dart';
import 'package:netflixdovini/screens/screens.telahome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> { 
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  //TextEditingController é uma variavel que "Observa"
  //e grava o que voce digita

  //Funcao para salvar os dados dentro do banco INTERNO DO CELULAR
  void SalvarDados() async {
    //abrir uma instancia do banco 
    dynamic banco = await SharedPreferences.getInstance();
    //Aguarda o banco salvar dentro do celular no campo Email , 
    //o email que o usuario digitou
    await banco.setString("email", email.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(color: Colors.black,width: double.infinity,height: double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRabNrdMwG05cFKpqronk1R91RotP0T8_b4Af_x76qJJ4WnBDBYPwJHKIh-&s=10", width: 200,),
              TextField(controller:email),
              TextField(controller:senha),
              TextButton(onPressed: (){
                SalvarDados();
                Navigator.push(context,MaterialPageRoute(builder: (context)=> TelaHome()));
              }, child: Text("Login"))
          ],)
        ],
      )
    );
  }
}