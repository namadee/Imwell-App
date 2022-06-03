import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:imwell/constants.dart';

import '../navigation_drawer.dart';

class mapView extends StatefulWidget {
  @override
  State<mapView> createState() => mapViewState();
}

class mapViewState extends State<mapView> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = markerIdVal(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      //infowindow
    );
    setState(() {
      // print("This is marker \n\n\n");
      // print(marker);
      markers[markerId] = marker;
    });
  }

  // getMarkerData() async {
  //   FirebaseFirestore.instance.collection('Locations').get().then((myMarkers) {
  //     if (myMarkers.docs.isNotEmpty) {
  //       for (int i = 0; i < myMarkers.docs.length; i++) {
  //         initMarker(myMarkers.docs[i].data, myMarkers.docs[i].id);
  //       }
  //     }
  //   });
  // }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('centres').get().then((myData) {
      if (myData.docs.isNotEmpty) {
        //print(myData);
        for (int i = 0; i < myData.docs.length; i++) {
          initMarker(myData.docs[i].data, myData.docs[i].id);
        }
      } else {
        //print("mydata.docs is empty");
      }
    });

    void initState() {
      super.initState();

      getMarkerData();
    }
  }

  late Position currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 12);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(7.472981, 80.354729),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
          markerId: MarkerId('Vaccine centres'),
          position: LatLng(7.472981, 80.354729),
          icon: BitmapDescriptor.defaultMarker,
        )
      ].toSet();
    }

    return Scaffold(
      body: GoogleMap(
        //markers: Set<Marker>.of(markers.values),
        markers: getMarker(),

        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        //markers: {_kGooglePlexMarker, _kLakeMarker},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          newGoogleMapController = controller;
          locatePosition();
        },
      ),
    );
  }
}
