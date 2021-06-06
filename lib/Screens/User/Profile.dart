import "package:flutter/material.dart";

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(110),
              bottomLeft: Radius.circular(110),
          ),
              color: Colors.green.shade400
          )
          ),
        ],
      )
    );
  }

}