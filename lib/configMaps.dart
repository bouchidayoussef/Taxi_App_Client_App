import 'package:firebase_auth/firebase_auth.dart';

import 'Models/allUsers.dart';

String mapKey = "AIzaSyBYsZ0WQhbK8RPc6Z8xRx0bL4cLRAFCkmc";

User? firebaseUser;

Users? userCurrentInfo;

int driverRequestTimeOut = 40;

String statusRide = "";
String carDetailsDriver = "";
String rideStatus = "Driver is Coming";
String driverName = "";
String driverphone = "";

double starCounter = 0.0;
String title="";

String serverToken = "key=AAAA9JagHLA:APA91bGRVhv3Ig2WhVjARE-O4cQ84rtKYfk1qDwPA2qtbqxi7Im7qwAIwMv2DQEG4UjMLqpQBY4HqUYiRqN32lcO3h6oziRp4o-Va3V0IewrlQFvrXymYG85FZEvWgcfa0FVidvDEm_w";