import 'package:firebase_database/firebase_database.dart';

class Users
{
  String id ="bro";
  String email ="bro";
  String name ="bro";
  String phone ="bro";

  Users({required this.id,required this.email, required this.name, required this.phone});

  Users.fromSnapshot(DataSnapshot dataSnapshot)
  {
    id= dataSnapshot.key!;
    email=dataSnapshot.value["email"];
    name=dataSnapshot.value["name"];
    phone=dataSnapshot.value["phone"];
  }
}