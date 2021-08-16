import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogleScreen extends StatefulWidget {
  const MapGoogleScreen({Key? key}) : super(key: key);

  @override
  _MapGoogleScreenState createState() => _MapGoogleScreenState();
}

class _MapGoogleScreenState extends State<MapGoogleScreen> {
  // Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    // final CameraPosition _initialBreakPoint = CameraPosition(
    //   target: LatLng(37.42796133580664, -122.085749655962),
    //   zoom: 14.4746,
    // );

    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
        body: Center(
      child: Text('Map here'),
    ));
  }
}

// the map
// GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _initialBreakPoint,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
