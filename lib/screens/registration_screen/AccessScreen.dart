import 'package:askme/layout/cubit/app_states.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class AccessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state) {
          var cubit = AppCubit();
          return Scaffold(
            body: Stack(
              children:[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/askme.png'),
                      fit: BoxFit.contain,
                    ),
                  ), // your other widgets here
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 100),
                            child: MaterialButton(
                              onPressed: (){
                                cubit.MoveToSigninScreen(context);
                              },
                              child:
                              Container(
                                height: 50,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: HexColor('FE8235'),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text('Sign in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, bottom: 100),
                            child: MaterialButton(onPressed: (){
                              cubit.MoveToRegisterScreen(context);
                            },
                              child:
                              Container(
                                height: 50,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: HexColor('FE8235'),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text('Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }

}