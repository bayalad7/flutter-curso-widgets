/*
 * Notas.
 * 01 - Awesome Flutter Snippets: Comando "mateapp"
 *      Crea toda la interface gráfica para lanzar una aplicación de Flutter por defecto.
 * 02 - Awesome Flutter Snippets: Comando "statelessW"
 *      Crea toda la interface de una clase para un StatelessWidget
 */

import 'package:flutter/material.dart';

// import 'src/pages/home_tmp.dart';
import 'src/pages/home.dart';

// Páginas para la navegación de las pantallas
import 'src/pages/alert.dart';
import 'src/pages/avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Widget's",
      // home: PageHomeTmp(),
      // home: PageHome(),
      initialRoute: "home",
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => PageHome(),
        "alert": (BuildContext context) => PageAlert(),
        "avatar": (BuildContext context) => PageAvatar(),
      },
    );
  }
}
