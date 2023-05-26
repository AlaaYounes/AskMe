import 'dart:io';

import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/shared/Network/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/component/Constants.dart';
import 'cubit/app_states.dart';

class AskMeLayout extends StatelessWidget {
  Auth auth = Auth();
  var image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        print('-------------------------------------');
        print(data.toString());

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('FE8235'),
              leading: Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  child: Image(image: AssetImage('images/avatar.png')),
                  // child: Image(
                  //   image: NetworkImage('${data['profilePhoto']}')
                  // ),
                  radius: 20,
                ),
              ),
              title: Text('${data['username']}'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      auth.SignOut(context);
                    },
                  ),
                ),
              ],
              elevation: 0.0,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.BottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChangeBottomNav(index);
              },
            ),
          ),
        );
      },
    );
  }
}
