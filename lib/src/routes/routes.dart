import 'package:flutter/material.dart';
import 'package:qrreader/src/screens/home/home_screen.dart';
import 'package:qrreader/src/screens/maps/map_google_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (_) => HomeScreen(),
    'map': (_) => MapGoogleScreen()
  };
}
