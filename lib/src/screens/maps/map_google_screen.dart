import 'package:flutter/material.dart';
import 'package:qrreader/src/models/scan_model.dart';

class MapGoogleScreen extends StatelessWidget {
  const MapGoogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
