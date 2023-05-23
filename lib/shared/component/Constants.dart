import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

User? user = FirebaseAuth.instance.currentUser;
String uid= user!.uid;
var data;
String Defualt ='images/avatar.png';
var random = Random();
final String roomID = (random.nextInt(10000000) + 10000000).toString();
var meetingData;
var updateddata;