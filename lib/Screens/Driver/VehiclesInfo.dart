import 'package:flutter/material.dart';
import 'package:trackingapp/Widgets/TaxiButton.dart';
import 'package:trackingapp/brand_colors.dart';

class VehicleInfo extends StatefulWidget {
  static const String id = "VehicleInfo";
  const VehicleInfo({Key key}) : super(key: key);

  @override
  _VehicleInfoState createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left:30.0,right: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
                ),
                Image(
                  alignment: Alignment.center,
                  image: AssetImage(
                      "images/logo.png"
                  ),
                  height: 120,
                  width: 120,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
                ),
                Column(
                  children: [
                    Text(
                        "Enter Text Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Brand-bold",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.04,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: BrandColors.colorAccentPurple,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                        // expands: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Car Model",
                          labelStyle:TextStyle(
                            fontSize: 14,
                          ),
                          hintText: "Ex:- Hyundai Verna",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.04,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: BrandColors.colorAccentPurple,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                        // expands: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Car Colour",
                          labelStyle:TextStyle(
                            fontSize: 14,
                          ),
                          hintText: "Ex:- Black,Grey etc ",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.04,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: BrandColors.colorAccentPurple,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                        // expands: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Vehicle Number",
                          labelStyle:TextStyle(
                            fontSize: 14,
                          ),
                          hintText: "Ex:- UP70 AZ 1125",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.04,
                    ),
                    TaxiButton(
                      title: "PROCEED",
                      bgColor: BrandColors.colorAccentPurple,
                      onPressed: (){

                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
