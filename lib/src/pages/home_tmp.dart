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
 * 06 - Para agregar una lista dinámicamente al ListView a partir de un arreglo de string’s,
 *      vamos a crear un método para regresar una lista de widget’s que es lo que espera
 *      el argumento de children dentro del ListView;
 *      Para este ejemplo nuestro método se llamará _crearItems().
 * 07 - Dart nos ofrece un operador bien interesante
 */
import 'package:flutter/material.dart';

class PageHomeTmp extends StatelessWidget {
  final List<String> items = [
    "Lista Item 1",
    "Lista Item 2",
    "Lista Item 3",
    "Lista Item 4",
    "Lista Item 5"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget's Temporales"),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  // ListTile’s a partir de una lista estática (arreglo de string’s) - Forma 01
  List<Widget> _crearItems() {
    // Aquí creamos una lista de widget's dinámicamente, sin definir el largo de la lista.
    List<Widget> lista = <Widget>[];

    for (var item in items) {
      // print("El item: $item");
      final itemWidget = ListTile(
        title: Text(item),
      );
      lista..add(itemWidget)..add(Divider());
    }

    return lista;
  }

  // ListTile’s a partir de una lista estática (arreglo de string’s) - Forma 02
  List<Widget> _crearItemsCorto() {
    // Aquí regresamos una nueva lista iterable, donde recorre cada uno de los elementos de la lista
    return items.map((item) {
      // Regresamos un widget Column() que regrese un arreglo de widget's ListTile() junto con su Divider()
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            // subtitle: Recibe un widget de tipo Text() para agregar un texto por debajo del título principal del item de la lista
            subtitle: Text("Subtítulo del item"),
            // leading: Recibe un widget que se posiciona al inicio del item de la lista
            leading: Icon(Icons.circle),
            // trailing: Recibe un widget que se posiciona al final del item de la lista
            trailing: Icon(Icons.keyboard_arrow_right),
            // onTap: Recibe un método void y hace la ilusión a como si se le pudiera hacer un click al item de la lista
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList(); // Tenemos que convertirlo a una lista para que no exista error al momento de regresar la lista de widget's
  }
}
