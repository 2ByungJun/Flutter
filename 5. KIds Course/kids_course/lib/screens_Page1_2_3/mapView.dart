import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapview extends StatelessWidget {
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
  MapType _googleMapType = MapType.normal;
  int _mapType = 0;
  Set<Marker> _markers = Set();


  CameraPosition _initialCameraPosition  = CameraPosition(
    target: LatLng(37.382782, 127.1189054),
    zoom: 13.0,
  );

  // 맵이 완성됬을 때, 이제 해당 controller 를 프로그램에서 보여줄 준비가 되었다.
  void _onMapCreated (GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(markerId: MarkerId('myInitialPostion'), position: LatLng(37.382782, 127.1189054),
      infoWindow: InfoWindow(title: '현재 위치', snippet: '주소지 등록을 하시겠습니까?'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: _googleMapType,
                initialCameraPosition: _initialCameraPosition ,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                markers: _markers,
              ),
            ],
        ),
      );
  }

}