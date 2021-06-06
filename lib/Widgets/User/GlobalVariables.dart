import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trackingapp/DataModels/Users.dart';
import 'package:trackingapp/DataModels/Drivers.dart';

String mapKey="AIzaSyDo3VloofMnq6q5TpJ_MVu2f92GCHSF-Oc";

String serverKey = "key=AAAAGzJJMSE:APA91bF2598PO7ViYgldeCu7tgZJBFUabtF0X205OLZdBsU8E4xDwxusG4lRbOW0KH7cpacFPOhvRih4wxb1Lojl2Y7pSNH5d-eqITcvSkG3ihtBei7uIyZX7OttA8cC4yoh5avM7CFa";

// FirebaseAuth currentFirebaseUser;
// FirebaseAuth currentFirebaseDriver;
Users currentUserInfo;
Drivers currentDriverInfo;
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
StreamSubscription<Position> homeTabPositionStream;
StreamSubscription<Position> ridePositionStream;
// Position currentPosition;