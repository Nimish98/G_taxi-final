import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:trackingapp/Widgets/User/GlobalVariables.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}
class ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person_rounded,
                      size: 80,
                      color: Colors.grey,)
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUserInfo.name,
                            style: TextStyle(
                              fontSize: 23,
                                fontFamily: "Brand-Bold",
                            color: Colors.black87),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "E Mail : ${currentUserInfo.email}",
                            style: TextStyle(
                                fontSize: 14,
                                ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Mobile : ${currentUserInfo.phoneNumber}",
                            style: TextStyle(
                                fontSize: 14,
                               ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 95,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                    Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.black87
                        )
                      ),
                      child: Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Brand-Bold",
                              color: Colors.black87),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2+20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Color(0xffa6f1a6),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2+50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(1),
                    spreadRadius: 40,
                    blurRadius: 150,
                    offset: Offset(2,2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(70),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    );
  }

}