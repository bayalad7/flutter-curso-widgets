/*
 * Notas.
 */

import 'package:flutter/material.dart';

import 'dart:math';

Map<int, String> _randomImagenes = {
  0: "https://www.wallpapertip.com/wmimgs/103-1030786_girls-pic-with-lighting.jpg",
  1: "https://www.wallpapertip.com/wmimgs/81-811946_fondos-de-pantalla-para-pc-8k.jpg",
  2: "https://www.wallpapertip.com/wmimgs/153-1530941_fondos-de-pantalla-animados-pc-anime.jpg",
  3: "https://www.wallpapertip.com/wmimgs/91-914296_wallpapers-4k-para-pc-fondos-de-pantalla-4k.jpg",
  4: "https://www.wallpapertip.com/wmimgs/3-38010_fortnite-season6-full-hd-wallpaper-pc-fondos-de.jpg",
  5: "https://www.wallpapertip.com/wmimgs/138-1383675_fortnite-marshmello-wallpaper-hd-fortnite-xbox-exclusive-fondos.jpg",
  6: "https://www.wallpapertip.com/wmimgs/3-32273_fortnite-dark-voyager-wallpaper-4k.jpg",
  7: "https://www.wallpapertip.com/wmimgs/80-802160_dark-souls-background-4k.jpg",
  8: "https://www.wallpapertip.com/wmimgs/80-802206_728205-title-dark-souls-3-pic-1-video.jpg",
  9: "https://www.wallpapertip.com/wmimgs/169-1698161_ultra-hd-dark-souls-3.jpg",
};

class PageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Card"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: <Widget>[
          _cardTipoPrincipal(),
          SizedBox(height: 10.0),
          _cardTipoSecundario(),
        ],
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

  Widget _cardTipoPrincipal() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.amber),
            title: Text("Título de la tarjeta"),
            subtitle: Text("Subtítulo de la tarjeta principal"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(child: Text("Aceptar"), onPressed: () {}),
              TextButton(child: Text("Cancelar"), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoSecundario() {
    var imagen = _randomImagenes[Random().nextInt(9)].toString();
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage("assets/images/loading.gif"),
            image: NetworkImage(imagen),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text("Texto debajo de la imagen"),
          ),
        ],
      ),
    );
  }
}
