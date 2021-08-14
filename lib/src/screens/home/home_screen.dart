import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
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
  const _HomeScreenBody({Key? key}) : super(key: key);

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
