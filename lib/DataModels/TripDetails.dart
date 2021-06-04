import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripDetails{
  String destinationAddress;
  String pickupAddress;
  LatLng pickUp;
  LatLng destination;
  String rideId;
  String paymentMethod;
  String riderName;
  String riderPhone;
  TripDetails({
    this.destinationAddress,
    this.rideId,
    this.destination,
    this.pickUp,
    this.pickupAddress,
    this.paymentMethod,
    this.riderName,
    this.riderPhone
  });
}