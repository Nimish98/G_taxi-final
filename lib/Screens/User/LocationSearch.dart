import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trackingapp/Helpers/HelperMethods.dart';
import 'package:trackingapp/Screens/Driver/DriverMainPage.dart';
import 'package:trackingapp/Screens/User/MainPage.dart';

class LocationSearch extends StatefulWidget {
  static const String id= "LocationSearchPage";
  const LocationSearch({Key key}) : super(key: key);

  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  Position currentPosition;
  bool user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
       user = ModalRoute.of(context).settings.arguments;
    });
    HelperMethods.currentLocation().then((Position position) {
      currentPosition = position;
      if(user==true) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.id, (route) => false,
            arguments: currentPosition);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, DriverMainPage.id, (route) => false,arguments: currentPosition);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("images/location.gif",height: 500,width: 500,),
            Text(
                "Please Wait while we fetch your current location...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF334b5f),
                fontSize: 22,
                fontFamily: "Brand-Bold",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
