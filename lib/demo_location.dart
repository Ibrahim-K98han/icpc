import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DemoLocation extends StatefulWidget {
  const DemoLocation({Key? key}) : super(key: key);

  @override
  State<DemoLocation> createState() => _DemoLocationState();
}

const kGoogleApiKey = 'AIzaSyA-Nfa895raXEBDOUjzIcKEYQxPAMqvLM0';

class _DemoLocationState extends State<DemoLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocationj;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocationj = location;
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocationj = newLoc;
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              zoom: 14,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ))));
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'images/person.png')
        .then((icon){
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'images/person.png')
        .then((icon){
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'images/person.png')
        .then((icon){
      currentIcon = icon;
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Track'),
        ),
        body: currentLocationj == null
            ? Center(child: Text('Loading'))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocationj!.latitude!,
                      currentLocationj!.longitude!),
                  zoom: 14,
                ),
                polylines: {
                  Polyline(
                      polylineId: PolylineId('route'),
                      points: polylineCoordinates,
                      color: Colors.red,
                      width: 6)
                },
                markers: {
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    icon: currentIcon,
                    position: LatLng(currentLocationj!.latitude!,
                        currentLocationj!.longitude!),
                  ),
                  Marker(
                    markerId: MarkerId('source'),
                    position: sourceLocation,
                  ),
                  Marker(
                    markerId: MarkerId('destination'),
                    position: destination,
                  )
                },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
              ));
  }
}
