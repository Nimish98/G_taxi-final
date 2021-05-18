import 'package:flutter/cupertino.dart';
import 'package:trackingapp/DataModels/Address.dart';
import 'package:trackingapp/DataModels/Users.dart';

class AppData extends ChangeNotifier{

  Address pickupAddress;
  Address destinationAddress;
  Users info;

  void updatePickupAddress(Address pickup){
    pickupAddress=pickup;
    notifyListeners();
  }

  void updateDestinationAddress(Address destination){
    destinationAddress=destination;
    notifyListeners();
  }

  void userInformation(Users information){
    info=information;
    notifyListeners();
  }

}