import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/core/providers/scan_provider.dart';
import 'package:qrreader/src/core/providers/selected_index_provider.dart';
import 'package:qrreader/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new SelectedIndexProvider()),
        ChangeNotifierProvider(create: (_) => new ScanProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.deepPurple,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple)),
          initialRoute: '/',
          routes: getApplicationRoutes()),
    );
  }
}
