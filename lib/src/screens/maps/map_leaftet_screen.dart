import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:qrreader/src/models/scan_model.dart';

class MapLeafletScreen extends StatefulWidget {
  const MapLeafletScreen({Key? key}) : super(key: key);

  @override
  _MapLeafletScreenState createState() => _MapLeafletScreenState();
}

class _MapLeafletScreenState extends State<MapLeafletScreen> {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    final double coordinateX =
        double.parse(scan.value.split(':')[1].split(',')[0]);
    final double coordinateY =
        double.parse(scan.value.split(':')[1].split(',')[1]);
    print(coordinateX);
    print(coordinateY);

    return Scaffold(
        appBar: AppBar(
          title: Text('Mapas'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(coordinateX, coordinateY),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(coordinateX, coordinateY),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.room,
                      color: Colors.blue.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
