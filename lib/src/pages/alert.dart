/*
 * Notas.
 */

import 'package:flutter/material.dart';

class PageAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Alerta"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          // Regresar a la pantalla anterior
          Navigator.pop(context);
        },
      ),
    );
  }
}
