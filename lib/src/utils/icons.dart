/*
 * Notas.
 * 01 - getIcon
 *      Vamos a crear una solución para regresar un icono de flutter mediante
 *      un método que nos permita convertir iconos en base al string de un texto
 *      que manipulemos
 */

import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

Icon getIcon(String icono) {
  return Icon(_icons[icono], color: Colors.amber);
}
