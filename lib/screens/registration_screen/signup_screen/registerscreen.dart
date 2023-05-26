import 'dart:io';

import 'package:askme/layout/cubit/app_states.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/home_screen/homeScreen.dart';
import 'package:askme/screens/registration_screen/sign%20in/login_screen.dart';
import 'package:askme/carbage%20screens/information_screen.dart';
import 'package:askme/shared/Network/Auth.dart';
import 'package:askme/shared/component/component.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final fullNameController = TextEditingController();
  final jobController = TextEditingController();

  bool isPassword = false;

  var formKey = GlobalKey<FormState>();

  XFile? image = XFile("");
  String? urlImage;
  Auth auth =Auth();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  // Stack(
                  //   alignment: AlignmentDirectional.bottomEnd,
                  //   children: [
                  //     Container(
                  //       width: 180,
                  //       height: 180,
                  //       alignment: Alignment.center,
                  //       clipBehavior: Clip.antiAlias,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Colors.black12,
                  //       ),
                  //       child: Container(
                  //         height: 200,
                  //         width: 200,
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             border: Border.all(width: 4, color: Colors.black),
                  //             image: DecorationImage(
                  //               image: FileImage(File(image!.path)),
                  //               fit: BoxFit.cover,
                  //             )),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       bottom: 10,
                  //       child: Container(
                  //         width: 35,
                  //         height: 35,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: Colors.black12,
                  //         ),
                  //         child: Container(
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: Colors.blue,
                  //           ),
                  //           child: IconButton(
                  //               alignment: Alignment.center,
                  //               icon: Icon(
                  //                 Icons.add,
                  //                 color: Colors.white,
                  //                 size: 15,
                  //               ),
                  //               onPressed: () {
                  //                 pickImage();
                  //               }),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: defaultFormField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.person,
                        labelText: 'Name',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: defaultFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Email';
                          }
                          return null;
                        },
                        prefixIcon: Icons.email_outlined),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: StatefulBuilder(builder:
                        (BuildContext context, StateSetter setState) {
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
                        suffix: isPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        isPassword: isPassword,
                      );
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: defaultFormField(
                      controller: jobController,
                      keyboardType: TextInputType.text,
                      labelText: 'Job',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'enter job title must not be empty';
                        }
                        return null;
                      },
                        prefixIcon:  Icons.badge,
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            urlImage= await auth.uploadImageToFirebase(image);
                            // print('url imageeeeeeeeeeeee:     ${urlImage}');
                            auth.SignUp(
                              context: context,
                              name: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              job: jobController.text,
                              // imageURL: await urlImage,
                            );
                            // print('url imageeeeeeeeeeeee:     ${urlImage}');
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: HexColor('FE8235'),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            'Sign up',
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
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
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

  pickImage() async{
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }
}
