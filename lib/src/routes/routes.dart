import 'package:flutter/material.dart';
import 'package:qrreader/src/screens/home/home_screen.dart';
import 'package:qrreader/src/screens/maps/maps_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    'maps': (_) => MapsScreen()
  };
}
