import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

dynamic usuarioId;
dynamic usuarioEmail;
dynamic usuarioSenha;


