import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/Widgets/GlobalVariables.dart';
import 'package:trackingapp/Widgets/TaxiButton.dart';
import 'package:trackingapp/brand_colors.dart';

class HomeTab extends StatefulWidget {
  Position coordinate;
  HomeTab({Key key,this.coordinate}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller  = Completer();
  double topPadding = 0;

  void setupPositionLocator(){
    LatLng pos = LatLng(widget.coordinate.latitude,widget.coordinate.longitude);
    mapController.animateCamera(CameraUpdate.newLatLng(pos));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.terrain,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          padding: EdgeInsets.only(top: topPadding,),
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.coordinate.latitude,widget.coordinate.longitude),
            zoom: 13,
          ),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
            mapController = controller;
            setState(() {
              topPadding = MediaQuery.of(context).size.height*0.70;
            });
            setupPositionLocator();
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.25,
          width: MediaQuery.of(context).size.width,
          color: BrandColors.colorPrimary,
        ),
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaxiButton(
                title: "GO ONLINE",
                bgColor: BrandColors.colorOrange,
                onPressed: (){
                  goOnline();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goOnline(){
    Geofire.initialize("driversAvailable");
    Geofire.setLocation(currentDriverInfo.uId, widget.coordinate.latitude, widget.coordinate.longitude);
    DatabaseReference tripRequestRef = FirebaseDatabase.instance.reference().child("Drivers/DriversData/${currentDriverInfo.uId}/new_trip");
    tripRequestRef.set("waiting");

    tripRequestRef.onValue.listen((event) {

    });
  }

}
