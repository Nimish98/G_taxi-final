import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trackingapp/DataModels/Users.dart';
import 'package:trackingapp/DataModels/Drivers.dart';

String mapKey="AIzaSyDo3VloofMnq6q5TpJ_MVu2f92GCHSF-Oc";

// FirebaseAuth currentFirebaseUser;
// FirebaseAuth currentFirebaseDriver;
Users currentUserInfo;
Drivers currentDriverInfo;
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
StreamSubscription<Position> homeTabPositionStream;