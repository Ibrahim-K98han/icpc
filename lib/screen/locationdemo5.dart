import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationDemo5 extends StatefulWidget {
  const LocationDemo5({Key? key}) : super(key: key);

  @override
  State<LocationDemo5> createState() => _LocationDemo5State();
}

const kGoogleApiKey = 'AIzaSyA-Nfa895raXEBDOUjzIcKEYQxPAMqvLM0';

class _LocationDemo5State extends State<LocationDemo5> {
  final Completer<GoogleMapController> _controller = Completer();

  //static const LatLng sourceLocation = LatLng(23.8118171, 90.3574052);
  static const LatLng destination = LatLng(23.8115857, 90.3568052);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  //BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destiontionIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLoationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 19.5,
              target: LatLng(newLoc.latitude!, newLoc.longitude!))));
      setState(() {

      });
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
        PointLatLng(destination.latitude, destination.longitude),
        PointLatLng(destination.latitude, destination.longitude)
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon(){
    // BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'images/p1.png').then((icon){
    //   sourceIcon = icon;
    // });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'images/destionation.png').then((icon){
      destiontionIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'images/person.png').then((icon){
      currentLoationIcon = icon;
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
        title: Text('Welcome to BUBT'),
      ),
      body: currentLocation == null
          ? Center(child: Text('Loading '))
          : GoogleMap(
        initialCameraPosition:
        // CameraPosition(target: LatLng(
        //     currentLocation!.latitude!, currentLocation!.longitude!),
        //     zoom: 14.5),
        CameraPosition(target: LatLng(currentLocation!.latitude!,currentLocation!.longitude!), zoom: 19.5),
        polylines: {
          Polyline(
              polylineId: PolylineId('route'),
              points: polylineCoordinates,
              color: Colors.pink,
              width: 6)
        },
        markers: {
          Marker(
            markerId: MarkerId('currentLocation'),
            icon: currentLoationIcon,
            position: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          // Marker(
          //   markerId: MarkerId('source'),
          //   position: sourceLocation,
          // ),
          Marker(
            markerId: MarkerId('destionation'),
            position: destination,
            //icon: destiontionIcon,
          )
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}

// CameraPosition(target: sourceLocation, zoom: 14.5),