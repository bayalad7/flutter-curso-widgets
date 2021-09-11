/*
 * Notas.
 */

import 'package:flutter/material.dart';

String imgProfile =
    "https://avatars.githubusercontent.com/u/35961826?s=400&u=592cfa130f50cf8907b5ae77fc4ce2e3f23ab12e&v=4";

class PageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Avatar"),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(imgProfile),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: CircleAvatar(
              child: Text("BA"),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/images/loading.gif"),
          image: NetworkImage(imgProfile),
          fadeInDuration: Duration(milliseconds: 200),
        ),
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
