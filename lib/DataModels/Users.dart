import 'package:firebase_database/firebase_database.dart';

 class Users{
  String name;
  String phoneNumber;
  String email;
  String uId;

  Users({
    this.phoneNumber,
    this.name,
    this.email,
    this.uId,
  });

  Users.fromSnapshot(DataSnapshot snapshot){
    uId = snapshot.key;
    phoneNumber = snapshot.value["Phone Number"];
    name = snapshot.value["Full Name"];
    email = snapshot.value["Email Address"];
  }

}