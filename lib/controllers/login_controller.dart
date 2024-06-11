import 'package:flutter/material.dart';
import 'package:flutter_app/presentacion/pages/nav_bar_pages.dart';

Future<void> login(String email, String password, BuildContext context) async {
  mostrarLoading(context);
  
  // Esperar 2 segundos
  await Future.delayed(const Duration(seconds: 2));
  
  // Navegar a la nueva pantalla
  Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) => const NavBarPages()));
}

mostrarLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        title: Text('Espere...',
        style: TextStyle(
          color: Colors.white
        )),
        content: LinearProgressIndicator(),
      ));
}