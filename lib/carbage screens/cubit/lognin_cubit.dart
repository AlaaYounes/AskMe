//
// import 'package:askme/layout/askMe_layout.dart';
//
// import 'package:askme/carbage%20screens/register_Screen.dart';
// import 'package:askme/shared/component/Constants.dart';
// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../shared/Network/Auth.dart';
//
//
// class AppSignInCubit extends Cubit<AppSignInStates> {
//   AppSignInCubit() : super(AppSignInIniatialState());
//   bool showPassword = false;
//   User? get user => FirebaseAuth.instance.currentUser!;
//   // Map<String, dynamic>? data;
//   Future <void> SigninWithEmailAndPassword({
//     required email,
//     required password,
//     required context,
//   })
//
//   async {
//     try{
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password);
//       print('hello');
//       User? user = FirebaseAuth.instance.currentUser;
//       if(user != null){
//         String uId = user.uid;
//         CollectionReference users = FirebaseFirestore.instance.collection('users');
//         DocumentSnapshot snapshot = await users.doc(uId).get();
//         if (snapshot.exists) {
//           Object data = snapshot.data()!;
//           print('User data: $data');
//         }
//       }
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (BuildContext context){
//                 return AuthScreen();
//               }), (r){
//         return false;
//       });
//       emit(AppSignInSuccessState());
//
//     }on FirebaseAuthException catch(e) {
//       print(e.code.toString());
//       if (e.code == 'user-not-found') {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(
//           content: Center(
//               child: Text(
//                 'email is not found.',
//               )),
//           padding: EdgeInsets.all(10),
//
//         ));
//       }
//       else if(e.code == 'wrong-password'){
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(
//           content:  Center(
//               child: Text(
//                 "wrong password.",
//               )),
//           padding: EdgeInsets.all(10),
//         ));
//         emit(AppSignInErrorState());
//       }
//     }
//   }
//
//
//
// }