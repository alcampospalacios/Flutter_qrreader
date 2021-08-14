import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qrreader/src/core/providers/selected_index_provider.dart';

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
        String barcodeScanRes = 'https://www.linkedin.com/in/alcampospalacios/';
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
