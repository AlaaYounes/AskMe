//
// import 'dart:io';
// import 'package:askme/layout/askMe_layout.dart';
// import 'package:http/http.dart' as http;
// import 'package:askme/model/UserModel.dart';
// import 'package:askme/screens/registration_screen/sign%20in/login_screen.dart';
// import 'package:askme/screens/registration_screen/signup_screen/cubit/register_states.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// class AppRegisterCubit extends Cubit<AppRegisterStates> {
//   AppRegisterCubit() : super(RegisterInitialState());
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   bool confirm = true;
//
//   Map<String, dynamic>? data;
//
//   Future SignUp({
//     context,
//      required String email,
//      required String name,
//      required String password,
//       String? image ='https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-1/188757593_4001473379942215_1647875222541759424_n.jpg?stp=dst-jpg_p160x160&_nc_cat=107&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeFX29fx-gAophuYVpW9kZTyi-lWZBDvenmL6VZkEO96eV7amnq2M8tSnDKcTt6LkbLZYpdTBkfuM4wZJzmrxGCl&_nc_ohc=VTg2TggLxrMAX_QJmuU&_nc_ht=scontent.faly1-2.fna&oh=00_AfDZI6MN_J00RLVvJ8Gf5VEJmys6huNv1qAVEVYwoUx7BA&oe=64778E4C'
//
//
//   }) async {
//
//     try{
//
//  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = userCredential.user;
//
// try {
//
// await   FirebaseFirestore.instance.
//             collection('users')
//             .doc(user!.uid)
//             .set({'email':email,'username': name, 'uid': user.uid,'password':password, 'image': image});
//
//             ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(
//       content:  Center(
//           child: Text(
//             'Sign up successfully, You can log in now !',
//           )),
//       padding: EdgeInsets.all(10),
//     ));
// Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
// }
// on FirebaseAuthException catch (e){
//   print(e.toString());
// }
//  DocumentSnapshot snapshot =
//       await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
//       data = snapshot.data() as Map<String, dynamic>;
//     }catch(error){
//       print(error.toString());
//       }
//   }
//
//
//
//   void PasswordConfirmed(bool confirm) {
//     if (confirmPasswordController.text.trim() ==
//         passwordController.text.trim()) {
//       confirm = true;
//       emit(RegisterPasswordConfirmedState());
//     } else {
//       confirm = false;
//       emit(RegisterPasswordConfirmedState());
//     }
//   }
//
//   void OpenSignInScreen(context) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//     emit(RegisterOpenSignInScreenState());
//   }
//
//
//   XFile imageFile = XFile("");
//   File? file;
//   Future<void> imageSelector(BuildContext context, String pickerType) async {
//     switch (pickerType) {
//       case "gallery":
//         imageFile = (await ImagePicker().pickImage(
//           source: ImageSource.gallery,
//           imageQuality: 90,
//         ))!;
//         break;
//       case "camera":
//         imageFile = (await ImagePicker().pickImage(
//           source: ImageSource.camera,
//           imageQuality: 90,
//         ))!;
//         break;
//     }
//     if (imageFile != null) {
//       file = File(imageFile!.path);
//       print("You selected image : ${imageFile?.path}");
//       emit(PickImageState());
//     } else {
//       print("You have not taken an image");
//       emit(PickImagefaildState("You have not taken an image"));
//     }
//   }
//   Future<String> uploadImageToFirebase(image) async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
//     try {
//       TaskSnapshot snapshot = await FirebaseStorage.instance
//           .ref()
//           .child('images/$fileName')
//           .putFile(image);
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print(e.toString());
//       return "error";
//     }
//   }
//   XFile? image = XFile("");
//   void gg() async {
//     final ImagePicker picker = ImagePicker();
//     image = await picker.pickImage(source: ImageSource.gallery);
//     emit(ggState());
//   }
//   pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     image = await picker.pickImage(source: ImageSource.gallery);
//   }
// }
