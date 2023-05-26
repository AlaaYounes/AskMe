import 'package:askme/layout/askMe_layout.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/shared/Network/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/app_states.dart';
import '../../shared/component/Constants.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = AppCubit();
        Auth auth = Auth();
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
        print(data.toString());

        // print('User data: ${data['username']}');
        // cubit.GetUserData();
        return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
               Container(
                 width: 180,
                 height: 180,
                 alignment: Alignment.center,
                 clipBehavior: Clip.antiAlias,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.black12,
                 ),
                 child: Container(
                   height: 200,
                   width: 200,
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(width: 4, color: Colors.black),
                       image: DecorationImage(
                         image: AssetImage('images/avatar.png'),
                         fit: BoxFit.cover,
                       )),
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Text('Name: ${data['username']}',
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 10),
               Text('Email: ${data['email']}',
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),

               SizedBox(height: 10,),
               Text('Job : ${data['job']}',
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
            ],
          ),
        ),
      );
      },
    );
  }

}