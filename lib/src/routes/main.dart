import 'package:flutter/material.dart';

// Páginas para la navegación de las pantallas
// import '../pages/home_tmp.dart';
import '../pages/home.dart';
import '../pages/alert.dart';
import '../pages/avatar.dart';
import '../pages/card.dart';

import '../pages/404.dart';

String getApplicationInitialRoute() {
  return "home";
}

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "home": (BuildContext context) => PageHome(),
    "alert": (BuildContext context) => PageAlert(),
    "avatar": (BuildContext context) => PageAvatar(),
    "card": (BuildContext context) => PageCard(),
  };
}

MaterialPageRoute getApplicationRouteE404(BuildContext context) {
  return MaterialPageRoute(builder: (BuildContext context) => PageE404());
}
