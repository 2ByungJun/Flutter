import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapview extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 리본 제거
      home: mapViewHome(),
    );
  }
}

class mapViewHome extends StatefulWidget {
  @override
  _mapviewHomeState createState() => _mapviewHomeState();
}

class _mapviewHomeState extends State<mapViewHome> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex  = CameraPosition(
    target: LatLng(37.575929, 126.976849),
    zoom: 3.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex ,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              compassEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
            ),
        ),
      );
  }

}