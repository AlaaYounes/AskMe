import 'package:askme/layout/askMe_layout.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/registration_screen/signup_screen/cubit/register_cubit.dart';
import 'package:askme/screens/registration_screen/signup_screen/cubit/register_states.dart';
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
  // var data = AskMeLayout().data;
  // HomeScreen.data(this.data);
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
        child: Column(
          children: [
            Row(
              children: [
                Text('Hello',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

                Text('${data['username']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      },
    );
  }

}