/*
 * Notas.
 * 01 - Creamos una pagina de inicio temporal para explicar como funcionan los
 *      widget's Listviews y como trabajar las listas de varias maneras.
 * 02 - ListView es el widget de desplazamiento más utilizado. Muestra a sus hijos
 *      uno tras otro en la dirección del desplazamiento. Para que nos demos una
 *      mejor idea de este widget, es como la aplicación de contactos que tenemos
 *      en nuestro teléfono, en el cual nosotros podemos realizar o hacer el scroll
 *      para ver los diferentes contactos que tenemos. 
 * 03 - Un ListView() es muy parecido a las filas (row) y columnas (column)
 *      también tienen su arreglo de children's "una lista de widget's" que puede
 *      ser cualquier widget.
 * 04 - En esa lista de widget’s, normalmente lo que se utiliza para poner un item
 *      en la lista, es el widget ListTile().
 * 05 - El widget Divider() pone sutilmente una línea entre la lista de children’s,
 *      como para separar cada item de la lista.
 */
import 'package:flutter/material.dart';

class PageHomeTmp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget's Temporales"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("ListTile Item"),
          ),
          Divider(),
          ListTile(
            title: Text("ListTile Item"),
          ),
          Divider(),
          ListTile(
            title: Text("ListTile Item"),
          ),
        ],
      ),
    );
  }
}
