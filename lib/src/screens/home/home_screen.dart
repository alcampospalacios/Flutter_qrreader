import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/core/providers/db_provider.dart';
import 'package:qrreader/src/core/providers/scan_provider.dart';
import 'package:qrreader/src/core/providers/selected_index_provider.dart';
import 'package:qrreader/src/screens/address/address_screen.dart';
import 'package:qrreader/src/screens/maps/maps_screen.dart';

import 'home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scanProvider =
                    Provider.of<ScanProvider>(context, listen: false);
                scanProvider.deleteAll();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavegationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    final currentIndex = selectedIndexProvider.index;

    switch (currentIndex) {
      case 0:
        return MapsScreen();

      case 1:
        return AddressScreen();

      default:
        return MapsScreen();
    }
  }
}
