/*
 * Notas.
 * 01 - Awesome Flutter Snippets: Comando "mateapp"
 *      Crea toda la interface gráfica para lanzar una aplicación de Flutter por defecto.
 * 02 - Awesome Flutter Snippets: Comando "statelessW"
 *      Crea toda la interface de una clase para un StatelessWidget
 */

import 'package:flutter/material.dart';

import 'src/routes/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Widget's",
      initialRoute: getApplicationInitialRoute(),
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return getApplicationRouteE404(context);
      },
    );
  }
}
