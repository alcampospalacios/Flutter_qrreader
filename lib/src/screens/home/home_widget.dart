import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrreader/src/core/helpers/acp_url_launcher.dart';
import 'package:qrreader/src/core/providers/scan_provider.dart';

import 'package:qrreader/src/core/providers/selected_index_provider.dart';
import 'package:qrreader/src/models/scan_model.dart';

class CustomNavegationBar extends StatelessWidget {
  const CustomNavegationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    final int currentIndex = selectedIndexProvider.index;

    return BottomNavigationBar(
        onTap: (value) => selectedIndexProvider.index = value,
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
        ]);
  }
}

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        // to simulator
        // String barcodeScanRes = 'https://www.linkedin.com/in/alcampospalacios/';
        String barcodeScanRes = 'geo: 46.280089,-75.922405';
        if (barcodeScanRes == '-1') return;

        final scanProvider = Provider.of<ScanProvider>(context, listen: false);
        ScanModel scan = await scanProvider.newScan(barcodeScanRes);
        launchURL(context, scan);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
