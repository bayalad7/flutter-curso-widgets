/*
 * Notas.
 * 01 - Ejecución del código con instancias.
 *      EJEMPLO - 01
 *      IMPORTANTE.
 *      Al realizar un Restart en la aplicación, la información que se encuentra en
 *      print(providerMenu.items); al inicio esta se encuentra vacía [], pero si hacemos un
 *      HotReload la misma información que se nos muestra con print(providerMenu.items);
 *      ahora si nos manda la información que se cargo con función de cargarData()
 *      y que se asigna desde dataMap["rutas"].
 *      
 *      ¿Por qué pasa esto?
 *      Aquí tenemos que tener presente mucho la forma en la que
 *      se esta ejecutando nuestro código de Flutter, cuando nosotros estamos disparando
 *      por primera vez la instrucción print(providerMenu.items); nuestra instancia
 *      del provider menu, lanza el servicio cargarData() para obtener la data del archivo
 *      .json que a su vez se llama con rootBundle.loadString que es un Future.
 *      Cosa que es un poco más lenta que la misma impresión que tenemos con print(providerMenu.items);
 *      Por eso da esa impresión. Si nosotros hacemos un HotReload apareceran los datos de los items
 *      por que no se esta reiniciando la aplicación, por consecuencia el servicio ya tiene los items
 *      cargados.
 * 
 *      Para resolver esto y poder obtener los items cargados, desde que se haga un reinicio en la aplicación,
 *      lo que tenemos que hacer es retornar un Future<List<dinamyc>> en la función cargarData().
 *      Un Future en momentos después, va a retornar la información que se encuentre adentro.
 * 
 * 02 - Future con .then()
 *      EJEMPLO - 02
 *      Mandamos a llamar el providerMenu.cargarData() y como este nos regresa un Future, podemos utilizar el .then()
 *      y recibir nuestra lista de items de tipo dinamicos. Vamos a esperar a obtener esa respuesta con el .then()
 * 03 - SUPER IMPORTANTE.
 *      Poner el return ListView() dentro de la espera cuando se cargan de los items en el
 *      providerMenu.cargarData().then((items){ __<AQUÍ>__}); ESTA ALTERNATIVA NO ES TAN VIABLE, por que
 *      si nuestro método de cargarData(), tardará mucho tiempo en retornarnos la información
 *      nuestra aplicación parecería como que si estuviera congelada o trabada y nadie quiere
 *      que su aplicación lusca de esta forma, cuando en realidad la aplicación solo esta tratando de obtener
 *      la información de algún lugar.
 * 04 - Por lo cual, no podemos hacerlo de esta manera, para nuestra suerte flutter nos ofrece lo que es el
 *      Future Builder
 * 
 * 05 - Future Builder
 *      EJEMPLO - 03 
 *      Vamos a retornar un Future Builder que es un widget que permite a dibujarse a si mismo basado
 *      en el último snapshot que interactuó con Future. Un Future tiene varios estados:
 *           - Cuando se está pidiendo información
 *           - Cuando se resuelve
 *           - Cuando da un error
 *      Esos son los 3 estados que nos interesa de un Future Builder
 * 06 - •	El argumento “builder” es requerido y recibe una función que tiene como argumento el
 *        BuildContext y un AsyncSnapShot que es del tipo que vayamos a retornar con nuestro método de espera.
 *             o Lo que retorna es un Widget Builder: En pocas palabras, ese widget builder significa que
 *               es algo que nos va a permitir dibujar algo en la pantalla de la aplicación.
 *             o Este Builder se va a disparar en varias etapas:
 *                    1.  Cuando se están pidiendo datos
 *                    2.  Cuando ya se obtuvo la respuesta
 *                    2.1 Cuando no hay data === snapshot.hasData
 *                    3.  Cuando tenemos un error === snapshot.hasError
 *             o El builder, debe de regresar un widget, y este widget se puede crear ya con la información
 *               que tengamos de la respuesta del Future.
 *             o Con el snapshot.data obtendremos la información de la respuesta. 
 *      • El argumento "future" tiene que estar enlazado a lo que nosotros queremos esperar,
 *        es decir; Nuestro Future de espera. Para nuestro ejemplo tendríamos que esperar que se llame el cargarData();
 *        el cual es nuestro Future.
 *      • El argumento "initialData" es opcional y en este se indica la información que va a tener por defecto,
 *        mientras no sea resuelto nuestro Future. Con esto podríamos crear un tipo de "loadings" o un mecanismo.
 */

import 'package:flutter/material.dart';

import '../providers/menu.dart';
import '../utils/icons.dart';

// Páginas para la navegación de las pantallas
// import '../pages/alert.dart';
// import '../pages/avatar.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget's"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /*
    EJEMPLO - 01
    print(providerMenu.items);
    */

    /*
    EJEMPLO - 02
    providerMenu.cargarData().then((items) {
      // Esperamos a obtener la respuesta de los items
      print("_lista");
      print(items);
    });
    */

    /*
    EJEMPLO - 03
    */
    return FutureBuilder(
      future: providerMenu.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }

        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> items = [];

    data?.forEach((item) {
      final widgetItem = ListTile(
        title: Text(item["texto"]),
        leading: getIcon(item["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amber),
        onTap: () {
          /*
          // Forma de Navegación 01
          var route;
          switch (item["ruta"]) {
            case "alert":
              route = MaterialPageRoute(
                builder: (context) => PageAlert(),
              );
              break;
            case "avatar":
              route = MaterialPageRoute(
                builder: (context) => PageAvatar(),
              );
              break;
          }
          Navigator.push(context, route);
          */

          // Forma de Navegación 02
          Navigator.pushNamed(context, item["ruta"]);
        },
      );

      items..add(widgetItem)..add(Divider());
    });

    return items;
  }
}
