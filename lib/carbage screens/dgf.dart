// import 'dart:io';
//
// import 'package:askme/screens/registration_screen/signup_screen/cubit/register_cubit.dart';
// import 'package:askme/shared/Network/Auth.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../shared/component/component.dart';
// import 'cubit/register_states.dart';
//
// class InformationScreen extends StatefulWidget {
//   @override
//   State<InformationScreen> createState() => _InformationScreenState();
//
// }
//
// class _InformationScreenState extends State<InformationScreen> {
//
//   var fullNameController = TextEditingController();
//
//   // String? image;
//   XFile? image = XFile("");
//   var formKey =GlobalKey<FormState>();
//   Auth auth = Auth();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'Fill Your Profile',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0.0,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Stack(
//             alignment: AlignmentDirectional.bottomEnd,
//             children: [
//               Container(
//                 width: 180,
//                 height: 180,
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.black12,
//                 ),
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(width: 4, color: Colors.black),
//                       image: DecorationImage(
//                         image: FileImage(File(image!.path)),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 child: Container(
//                   width: 35,
//                   height: 35,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black12,
//                   ),
//                   child: Container(
//                     height: 30,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.blue,
//                     ),
//                     child: IconButton(
//                         alignment: Alignment.center,
//                         icon: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 15,
//                         ),
//                         onPressed: () {
//                           pickImage();
//                         }),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Form(
//             key: formKey,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25.0),
//               child: defaultFormField(
//                   controller: fullNameController,
//                   keyboardType: TextInputType.text,
//                   prefixIcon: Icons.person,
//                   labelText: 'Name',
//                   validate: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter your name';
//                     }
//                     return null;
//                   }),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: MaterialButton(
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   // if (confirmPasswordController.text
//                   //     .trim() !=
//                   //     passwordController.text.trim()) {
//                   //   print('Passwords do not match.');
//                   //   return;
//                   // }
//                   // else {
//                 auth.SignUp(
//                 context: context,
//                 name: fullNameController.text,
//                 email: email,
//                 password: password,
//                   image: image.toString(),
//                 );
//               }
//               },
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: HexColor('FE8235'),
//                   borderRadius:
//                   BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Text(
//                   'Sign up',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   pickImage() async{
//     final ImagePicker picker = ImagePicker();
//     image = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//
//     });
//   }
//
// }
