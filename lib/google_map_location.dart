import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(36.2074, 37.1440);
  BitmapDescriptor sourceIcon =BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/Location.svg",).then((icon){
      sourceIcon =icon;
      setState(() {});
    });
  }
  @override
  void initState() {

    super.initState();
    setCustomMarkerIcon();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nurse Location",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body:  Center(
        child: GoogleMap(
          initialCameraPosition:
          const CameraPosition(target: sourceLocation, zoom: 18.5),
          markers:{
            Marker(
              icon: sourceIcon,
              markerId: MarkerId('source'),
              position: sourceLocation,
            ),
          },
        ),
      ),
    );
  }
}
