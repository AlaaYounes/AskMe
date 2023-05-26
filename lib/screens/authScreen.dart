// import 'package:askme/layout/askMe_layout.dart';
// import 'package:askme/screens/home_screen/homeScreen.dart';
// import 'package:askme/screens/registration_screen/sign%20in/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../shared/Network/Auth.dart';
// import '../shared/component/Constants.dart';
//
// class AuthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: Auth().authChanges,
//         builder: (context, snapshot){
//           print('!!!!!!!!!!!! hello from authScreen !!!!!!!!!!!!!!!!!!');
//           print(snapshot.toString());
//           updateddata = snapshot.data;
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.blue,
//               ),
//             );
//           }
//           if(!snapshot.hasData){
//             return LoginScreen();
//           }
//           return AskMeLayout();
//         },
//       ),
//     );
//     // return Scaffold(
//     //   body: StreamBuilder<User?>(
//     //     stream: FirebaseAuth.instance.authStateChanges(),
//     //       builder: (context, snapshot)
//     //       {
//     //         print("(++++++++++++++++++++++++++++++++++++++++++");
//     //         print(data.toString());
//     //         if (snapshot.connectionState == ConnectionState.waiting) {
//     //           return Center(
//     //             child: CircularProgressIndicator(
//     //                 color: Colors.blue,
//     //                 strokeWidth: 2,
//     //             ),
//     //           );
//     //         }
//     //         print("(++++++++++++++++++++++++++++++++++++++++++");
//     //         print(data.toString());
//     //         if(!snapshot.hasData){
//     //           return LoginScreen();
//     //         }
//     //         else{
//     //           return AskMeLayout();
//     //         }
//     //       }
//     //   ),
//     // );
//   }
// }
import 'package:askme/layout/askMe_layout.dart';
import 'package:askme/screens/home_screen/homeScreen.dart';
import 'package:askme/screens/registration_screen/sign%20in/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../shared/Network/Auth.dart';
import '../shared/component/Constants.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: Auth().authChanges,
            builder: (context, snapshot) {
              print('!!!!!!!!!!!! hello from authScreen !!!!!!!!!!!!!!!!!!');
              print(snapshot.toString());
              updateddata = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              if (snapshot.hasData) {
                return AskMeLayout();

              }else{
                return LoginScreen();
              }
            },
          ),
        );
    }
}