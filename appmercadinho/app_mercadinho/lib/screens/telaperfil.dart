import 'package:app_mercadinho/screens/telalogin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TelaPerfil extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController emailTrocar = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailTrocar.text = usuarioEmail;
  }

  void fazerPatch(dynamic id) async {
    final respostaServidor = await http.patch(Uri.parse("https://mercadinho-api-hhi8.onrender.com/usuarios/$id"));
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}