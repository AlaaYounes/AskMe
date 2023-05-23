import 'package:askme/layout/cubit/app_states.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/home_screen/homeScreen.dart';
import 'package:askme/screens/registration_screen/signup_screen/cubit/register_cubit.dart';
import 'package:askme/screens/registration_screen/signup_screen/cubit/register_states.dart';
import 'package:askme/shared/component/component.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  bool isPassword = false;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppRegisterCubit(),
        child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
            listener: (BuildContext context, state) {
              if (state is RegisterCreateUserSuccessState){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
              }
            },
            builder: (BuildContext context, Object? state) {
              var cubit = AppRegisterCubit();
              return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //subtitle
                            Text('Here you can make your account',
                                style: GoogleFonts.robotoCondensed(fontSize: 18)),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: defaultFormField(
                                  controller: fullNameController,
                                  keyboardType:  TextInputType.text,
                                  prefixIcon: Icons.person,
                                  labelText: 'Name',
                                  validate: (value){
                                    if(value!. isEmpty){
                                      return 'Enter your name';
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(height: 15,),

                            // email textfield
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: defaultFormField(controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  labelText: 'Email',
                                  validate: (value){
                                    if (value!.isEmpty) {
                                      return 'Enter a valid Email';
                                    }
                                return null;
                              },
                                prefixIcon: Icons.email_outlined
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //password textfield
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return defaultFormField(
                                      controller: passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                      labelText: 'Password',
                                      prefixIcon: Icons.lock_outline,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password must not be empty';
                                        }
                                        return null;
                                      },
                                      suffix: isPassword ? Icons.visibility : Icons
                                          .visibility_off,
                                      suffixPressed: () {
                                        setState(() {
                                          isPassword = !isPassword;
                                        }
                                        );
                                      },
                                      isPassword: isPassword,
                                    );
                                  }
                              ),
                            ),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            // //confirm password textfield
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 25),
                            //   child: StatefulBuilder(
                            //       builder: (BuildContext context, StateSetter setState) {
                            //         return defaultFormField(
                            //           controller: confirmPasswordController,
                            //           keyboardType: TextInputType.visiblePassword,
                            //           labelText: 'Confirm Password',
                            //           prefixIcon: Icons.lock_outline,
                            //           validate: (value) {
                            //             if (value!.isEmpty) {
                            //               return 'Password must not be empty';
                            //             }
                            //             return null;
                            //           },
                            //           suffix: isPassword ? Icons.visibility : Icons
                            //               .visibility_off,
                            //           suffixPressed: () {
                            //             setState(() {
                            //               isPassword = !isPassword;
                            //             }
                            //             );
                            //           },
                            //           isPassword: isPassword,
                            //         );
                            //       }
                            //   ),
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            //sign in button
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ConditionalBuilder(
                                condition: state is!RegisterCreateUserLoadingState,
                                builder: (context) => MaterialButton(
                                  onPressed: (){
                                    if(formKey.currentState!.validate()) {
                                      // if (confirmPasswordController.text
                                      //     .trim() !=
                                      //     passwordController.text.trim()) {
                                      //   print('Passwords do not match.');
                                      //   return;
                                      // }
                                      // else {
                                        cubit.SignUp(
                                            context: context,
                                            email: emailController.text,
                                            name: fullNameController.text,
                                            password: passwordController.text,
                                            );

                                    }

                                    },
                                  child:
                                  Container(
                                    height: 50,
                                    width: double.infinity,
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
                                ), fallback: (BuildContext context)=>
                                  Center(child: CircularProgressIndicator(),),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // text : sign up
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('already a member? ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(width: 10,),
                                TextButton(
                                  onPressed: ()=> cubit.OpenSignInScreen(context),
                                  child: Text(
                                    'Log in Now',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
           )
    );
  }
}
