import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    _database ??= await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'scanDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            );
          ''');
    });
  }

  // Old fashion
  // newScanRaw(ScanModel scan) async {
  //   final db = await database;
  //   final id = scan.id;
  //   final type = scan.type;
  //   final value = scan.value;

  //   final res = await db!.rawInsert('''
  //     INSERT INTO Scans(id, type, value) VALUES ($id, '$type', '$value')
  //     ''');
  // }

  Future<int> newScan(ScanModel scan) async {
    final db = await database;
    final res = await db!.insert('Scans', scan.toJson());

    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAll() async {
    final db = await database;
    final res = await db!.query('Scans');

    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  Future<List<ScanModel>?> getScanByType(String type) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'type = ?', whereArgs: [type]);

    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final res = await db!
        .update('Scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);

    return res;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db!.delete('Scans');

    return res;
  }
}
