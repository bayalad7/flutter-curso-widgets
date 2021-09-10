import 'package:flutter/material.dart';

class PageE404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Error 404"),
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
