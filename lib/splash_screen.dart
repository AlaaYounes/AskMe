// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             image: DecorationImage(
//               image: AssetImage('images/askme.png'),
//               fit: BoxFit.contain,
//             ),
//           ), // your other widgets here
//         ),
//     );
//   }
// }
import 'dart:async';

import 'package:askme/screens/authScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AuthScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('images/askme.png'),
                fit: BoxFit.contain,
              ),
            ), // your other widgets here
         ),
        );
    }
}