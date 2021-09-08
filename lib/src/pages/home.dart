import 'package:flutter/material.dart';

import '../providers/menu.dart';

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
    print(providerMenu.items);
    providerMenu.cargarData();

    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      ListTile(
        title: Text("Título Item"),
      ),
      Divider(),
      ListTile(
        title: Text("Título Item"),
      ),
      Divider(),
      ListTile(
        title: Text("Título Item"),
      ),
    ];
  }
}
