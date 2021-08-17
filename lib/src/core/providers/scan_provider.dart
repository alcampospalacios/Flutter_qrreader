import 'package:flutter/material.dart';
import 'package:qrreader/src/core/providers/db_provider.dart';
import 'package:qrreader/src/models/scan_model.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String _selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final scan = new ScanModel(value: value);
    final id = await DBProvider.db.newScan(scan);

    // Assign the database id to model
    scan.id = id;

    if (_selectedType == scan.type) {
      this.scans.add(scan);
      notifyListeners();
    }

    return scan;
  }

  void loadScans() async {
    final sc = await DBProvider.db.getAll();

    if (sc != null) {
      this.scans = [...sc];
      notifyListeners();
    }
  }

  void loadScansByType(String type) async {
    final sc = await DBProvider.db.getScanByType(type);
    print('scDB: $sc');

    if (sc != null) {
      this.scans = [...sc];
      this._selectedType = type;
      print(sc);
      notifyListeners();
    } else {
      this.scans = [];
      this._selectedType = type;
      notifyListeners();
    }
  }

  void deleteAll() async {
    await DBProvider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  void deleteScanById(int id) async {
    await DBProvider.db.deleteScanById(id);
    this.loadScansByType(this._selectedType);
  }
}
