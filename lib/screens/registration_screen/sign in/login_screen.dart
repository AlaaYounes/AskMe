import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/authScreen.dart';
import 'package:askme/screens/registration_screen/signup_screen/registerscreen.dart';
import 'package:askme/shared/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../layout/cubit/app_states.dart';
import '../../../shared/Network/Auth.dart';
import '../../../shared/component/Constants.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  Auth auth = Auth();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit();
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //image
                          Image.asset('images/askme.png',width: 300, height: 250,),
                          SizedBox(
                            height: 10,
                          ),
                          //title
                          Text(
                            'Sign In',
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //subtitle
                          Text('Welcome Back, We are here to help you!',
                              style: GoogleFonts.robotoCondensed(fontSize: 18)),
                          SizedBox(
                            height: 20,
                          ),
                          // email text-field
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: defaultFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                labelText: 'email',
                                prefixIcon: Icons.email_outlined,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email must not be empty';
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //password text-field
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
                          SizedBox(
                            height: 12,
                          ),
                          //sign in button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: MaterialButton(
                              onPressed: (){
                                formKey.currentState!.validate();
                                auth.SigninWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context);

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
                                child: Text('Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          // text : sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('not yet a member? ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(width: 10,),
                              TextButton(
                                onPressed: () {
                                  // cubit.MoveToRegisterScreen(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                                },
                                child: Text(
                                  'Sign Up Now',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
