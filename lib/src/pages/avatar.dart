/*
 * Notas.
 */

import 'package:flutter/material.dart';

class PageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Avatar"),
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
