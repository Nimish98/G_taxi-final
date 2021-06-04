import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackingapp/DataModels/TripDetails.dart';
import 'package:trackingapp/Widgets/Driver/TaxiOutlineButton.dart';
import 'package:trackingapp/Widgets/User/GlobalVariables.dart';
import 'package:trackingapp/Widgets/User/ProgressDialog.dart';
import 'package:trackingapp/brand_colors.dart';

class NotificationDialog extends StatelessWidget {

  final TripDetails tripDetails;
  final AssetsAudioPlayer assetAudioPlayer;

  const NotificationDialog({Key key,this.tripDetails,this.assetAudioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            Image.asset("images/taxi.png",width: 200,),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            Text("NEW TRIP REQUEST",style: TextStyle(fontSize: 18,fontFamily: "Brand-Bold"),),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.03,
                    ),
                    Image.asset("images/pickicon.png",height: 16,width: 16,),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04,
                    ),
                    Expanded(child: Text(tripDetails.pickupAddress,style: TextStyle(fontSize: 18),))
                  ],
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.03,
                    ),
                    Image.asset("images/desticon.png",height: 16,width: 16,),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04,
                    ),
                    Expanded(child:
                    Text(tripDetails.destinationAddress,style: TextStyle(fontSize: 18),))
                  ],
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02,
                ),
                Divider(
                  height: 2,
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                  color: BrandColors.colorLightGrayFair,
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
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                      child: TaxiOutlineButton(
                        title: "DECLINE",
                        textColor: BrandColors.colorPrimary,
                        color: Colors.white,
                        onPressed: (){
                          assetAudioPlayer.stop();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                      child: TaxiOutlineButton(
                          textColor: Colors.white,
                          title: "ACCEPT",
                          color: BrandColors.colorGreen,
                          onPressed: (){
                            assetAudioPlayer.stop();
                            checkAvailability(context);
                            Navigator.pop(context);
                          }
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  void checkAvailability(context){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return ProgressDialog(
            status: "Fetching Please Wait...",
          );
        }
    );

    DatabaseReference newRideRef = FirebaseDatabase.instance.reference().child("Drivers/DriversData/${currentDriverInfo.uId}");
    newRideRef.once().then((DataSnapshot snapshot) {

      Navigator.pop(context);

      String thisRideId =  "";
      if(snapshot.value!=null){
        thisRideId = snapshot.value["new_trip"].toString();
        print(thisRideId);
      }
      else{
        print("Ride Not Found");
      }
      if(thisRideId == tripDetails.rideId){
        newRideRef.update({
          "new_trip":"accepted",
        });
      }
      else if(thisRideId == "cancelled"){
        print("Ride has been cancelled");
      }
      else if(thisRideId == "timeout"){
        print("Ride has TimeOut");
      }
      else{
        print("Ride Not Found");
      }

    });
  }

}
