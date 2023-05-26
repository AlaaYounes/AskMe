
import 'dart:io';

import 'package:askme/layout/askMe_layout.dart';
import 'package:askme/carbage%20screens/register_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../screens/authScreen.dart';
import '../../screens/registration_screen/sign in/login_screen.dart';
import '../component/Constants.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges {
    return firebaseAuth.authStateChanges();
  }

  User? get user => firebaseAuth.currentUser!;


  Future SignUp({
    context,
    required String email,
    required String name,
    required String password,
    required String job,
    String? imageURL,

  }) async {

    try{

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      try {

        await   FirebaseFirestore.instance.
        collection('users')
            .doc(user!.uid)
            .set({'email':email,'username': name, 'uid': user.uid,'password': password,'job': job , 'profilePhoto': imageURL});

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          content:  Center(
              child: Text(
                'Sign up successfully, You can log in now !',
              )),
          padding: EdgeInsets.all(10),
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }
      on FirebaseAuthException catch (e){
        print(e.toString());
      }
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      data = snapshot.data() as Map<String, dynamic>;
    }catch(error){
      print(error.toString());
    }
  }


  Future<void> SigninWithEmailAndPassword({
    required email,
    required password,
    required context,
  }) async {
    try {
      // var data;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uId = user.uid;
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        DocumentSnapshot snapshot = await users.doc(uId).get();

        data = snapshot.data()! as Map<String, dynamic>;
        print("==================================");
        print(data.toString());
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AskMeLayout()), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Text(
            'email is not found.',
          )),
          padding: EdgeInsets.all(10),
        ));
      } else if (e.code == 'wrong=password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Text(
            "wrong password.",
          )),
          padding: EdgeInsets.all(10),
        ));
      }
    }
  }

  void createScheduleMeeting({
    required String meetingName,
    required String meetingID,
    required date,
    required time,
    required context,
  }) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('scheduleMeetings')
          .add({
        'meetingID': meetingID,
        'meetingName': meetingName,
        'Date': date,
        'Time': time,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
            child: Text(
              'your meeting is added successfully.',
            )),
        padding: EdgeInsets.all(10),
      ));
    } catch (e) {

        print(e);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get scheduleMeetingHistory =>
      firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('scheduleMeetings')
          .orderBy("Date")
          .snapshots();

  void deleteScheduleMeeting(id) {
      CollectionReference document = FirebaseFirestore.instance .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('scheduleMeetings');
      document.doc(id).delete().then((value) {
        print('Document deleted successfully.');
      }).catchError((error) {
        print('Error deleting document: $error');
      });
  }
  void CreatePost({
    required String username,
    required String text,
  }) async {
    await FirebaseFirestore.instance.collection('posts').doc().set({
      'username': username,
      'time': FieldValue.serverTimestamp(),
      'text': text,
    });
  }

  getPosts(){
    var snapshots = FirebaseFirestore.instance.collection('posts').orderBy('time').snapshots();
    return snapshots;
  }

  Future<void> SignOut(context) async {
    await FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text(
        'Sign out successfully',
      )),
      padding: EdgeInsets.all(10),
    ));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
  }

  Future<String> saveAssetImageToDevice() async {
    // Get the directory for the app's document path
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // Create the image file path
    String imagePath = '$appDocPath/avatar.png';

    // Check if the image file already exists
    File imageFile = File(imagePath);
    if (await imageFile.exists()) {
      return imagePath;
    }

    // Read the image data from assets
    ByteData imageData = await rootBundle.load(Defualt);

    // Save the image data to the device
    await imageFile.writeAsBytes(imageData.buffer.asUint8List());

    return imagePath;
  }

  Future<String> uploadImageToFirebase(image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref()
          .child('images/$fileName')
          .putFile(image);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

}

