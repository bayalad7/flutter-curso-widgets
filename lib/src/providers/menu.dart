/*
 * Notas.
 * 01 - Con esta clase haremos referencia para todo el manejo del archivo "data/menu.json"
 * 02 - Con el "package:flutter/services.dart" solo necesitamos exponer un objeto del paquete
 *      el cual es el rootBundle, de lo contrario importaríamos todo lo del paquete.
 * 03 - El rootBundle tiene todo lo que necesitamos para leer el archivo "data/menu.json"
 * 04 - El "rootBundle.loadString" todo eso regresa un future, que se puede manejar con el "then"
 *      y con eso obtendríamos todo el string de la data del archivo .json
 * 05 - Cuando instanciamos la clase y después queramos ejecutar un HotReload, el constructor
 *      _ProviderMenu(){ cargarData(); } no se vuelve a ejecutar porque solamente se ejecuta una sola vez.
 *      Si queremos que se vuelva a ejecutar tendremos que hacer un Restart.
 * 06 - Para convertir el JSON String en un Mapa, Dart tiene una función propia que está dentro
 *      del import 'dart:convert'; La cual es json.decode(data);
 */

import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _ProviderMenu {
  List<dynamic> items = [];

  _ProviderMenu() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    // Aquí cargamos la información del archivo .json estático
    final data = await rootBundle.loadString("data/menu.json");
    // Convertimos el data string en un mapa
    Map dataMap = json.decode(data);
    // Obtenemos las rutas del archivo .json, ya con el json convertido.
    items = dataMap["rutas"];
    return items;
  }
}

// Este archivo "provider/menu.dart" solo esta exponiendo la instancia creada del menú, dentro del mismo archivo de la clase.
final providerMenu = new _ProviderMenu();
