import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Home page'),
      ),
      bottomNavigationBar: CustomNavegationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
