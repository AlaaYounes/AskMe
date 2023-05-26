import 'package:askme/layout/askMe_layout.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/authScreen.dart';
import 'package:askme/screens/meeting_screen/schedule_screen.dart';
import 'package:askme/carbage%20screens/AccessScreen.dart';
import 'package:askme/screens/registration_screen/sign%20in/login_screen.dart';
import 'package:askme/carbage%20screens/information_screen.dart';
import 'package:askme/shared/Network/Auth.dart';
import 'package:askme/shared/component/Bloc_Observer.dart';
import 'package:askme/shared/component/Constants.dart';
import 'package:askme/splash_screen.dart';
import 'package:askme/screens/meeting_screen/create_meeting_screen.dart';
import 'package:askme/screens/meeting_screen/videocall.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'layout/cubit/app_states.dart';
import 'screens/chat_screen/ChatScreen.dart';
import 'carbage screens/dgf.dart';


var startWidget = AuthScreen();
String? imagePath;
Future<void> main() async {
  AwesomeNotifications().initialize('resource://drawable/askme', [
  NotificationChannel(
      channelKey: 'schedule key',
      channelName: 'schedule channel',
      channelDescription: 'notification for test',
      playSound: true,
      channelShowBadge: true),
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  Auth auth = Auth();
  imagePath = await auth.saveAssetImageToDevice();

  runApp(MyApp());
}

XFile imageFile = XFile(imagePath!);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
      ],
      child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)), // Replace this with your own async initialization process
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'AskMe',
              home: LoginScreen(),
              theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey),
              ),
            );
          } else {
            return SplashScreen(); // Replace this with your own splash screen widget
          }
        },
      )
      // MaterialApp(
      //
      //   home: startWidget,
      //   theme: ThemeData(
      //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //         selectedItemColor: Colors.deepOrange,
      //         unselectedItemColor: Colors.grey),
      //   ),
      // ),
    );
  }
}
// var startWidget = AuthScreen();
// String? imagePath;
// Future<void> main() async {
//   AwesomeNotifications().initialize('resource://drawable/askme', [
//     NotificationChannel(
//         channelKey: 'schedule key',
//         channelName: 'schedule channel',
//         channelDescription: 'notification for test',
//         playSound: true,
//         channelShowBadge: true),
//   ]);
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   Bloc.observer = MyBlocObserver();
//   Auth auth = Auth();
//   imagePath = await auth.saveAssetImageToDevice();
//
//   runApp(MyApp());
// }
//
// XFile imageFile = XFile(imagePath!);
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider<AppCubit>(create: (context) => AppCubit()..getUserData(uid)),
//         ],
//         child: BlocConsumer<AppCubit,AppStates>(
//             builder: (BuildContext context, state) {
//               return MaterialApp(
//                 home: SplashScreen(),
//                 theme: ThemeData(
//                   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                       selectedItemColor: Colors.deepOrange,
//                       unselectedItemColor: Colors.grey),
//                 ),
//               );
//             },
//             listener: (BuildContext context, Object? state) {},
//             ),
//         );
//     }
// }