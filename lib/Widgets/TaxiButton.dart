import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {

  String title;
  Function onPressed;
  Color bgColor;
  TaxiButton({this.title,this.onPressed,this.bgColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: bgColor,
      textColor: Colors.white,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: "Brand-Bold",
                fontSize: 20
            ),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
