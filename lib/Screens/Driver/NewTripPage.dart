import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/Widgets/User/TaxiButton.dart';
import 'package:trackingapp/brand_colors.dart';


class NewTripPage extends StatefulWidget {
  static const String id = "NewTripRequest";
  const NewTripPage({Key key}) : super(key: key);

  @override
  _NewTripPageState createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {

  GoogleMapController rideMapController;
  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> polyLinesSet = Set<Polyline>();
  Set<Marker> markers = Set<Marker>();
  Set<Circle> circles = Set<Circle>();
  List<LatLng> polyLineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  double topPadding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            circles:  circles,
            polylines: polyLinesSet,
            markers: markers,
            padding: EdgeInsets.only(top: topPadding,),
            initialCameraPosition: CameraPosition(
              target: LatLng(25.425730, 81.827493),
              zoom: 13,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              rideMapController = controller;
              setState(() {
                topPadding = MediaQuery
                    .of(context)
                    .size
                    .height * 0.70;
              });
              var currentLatLng = LatLng(25.425730, 81.827493);
              // var pickUp =
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,
                  ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.07,
                    ),
                    Text(
                    "14 Min",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Brand-Bold",
                        color: BrandColors.colorAccentPurple
                    ),
              ),
                  ],
                ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.07,
                  ),
                  Text("Nimish Mehrotra",
                    style: TextStyle(fontSize: 22, fontFamily: "Brand-Bold"),),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.3,
                  ),
                  Icon(
                    Icons.call,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.07,
                  ),
                  Image.asset("images/pickicon.png", height: 16, width: 16,),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Expanded(
                    child: Text(
                      "Addreds",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.07,
                  ),
                  Image.asset("images/desticon.png", height: 16, width: 16,),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Expanded(
                    child: Text(
                      "Destination Addresss",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TaxiButton(
                      title: "ARRIVED",
                      bgColor: BrandColors.colorGreen,
                      onPressed: (){

                      },
                    ),
                  )
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
