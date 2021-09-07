/*
 * Notas.
 * 01 - Extensión Awesome Flutter Snippets: Con el comando "mateapp",
 *      se crea toda la interface gráfica para lanzar una aplicación de Flutter por defecto.
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Widget's",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Widget's"),
        ),
        body: Center(
          child: Container(
            child: Text("Hola Mundo!"),
          ),
        ),
      ),
    );
  }
}
