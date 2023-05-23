import 'dart:io';

import 'package:askme/layout/cubit/app_states.dart';
import 'package:askme/screens/registration_screen/signup_screen/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../layout/cubit/cubit.dart';
import 'cubit/register_states.dart';

class ff extends StatelessWidget {
  @override
  XFile? image = XFile("");
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {  },

      builder: (BuildContext context,  state) {
        var cubit = AppCubit();
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(File(
                            cubit.imageFile.path)),
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Pick Image From',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          cubit.imageSelector(
                                              context, "gallery");
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty
                                              .all<Color>(
                                              Colors.blue),
                                        ),
                                        child: Text('Gallery'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                         cubit.imageSelector(
                                              context, "camera");
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty
                                              .all<Color>(
                                              Colors.blue),
                                        ),
                                        child: Text('Camera'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                              color: Colors.white, width: 2)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
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
// pickImage() async{
// final ImagePicker picker = ImagePicker();
// image = await picker.pickImage(source: ImageSource.gallery);
// setState(() {
//
// });
// }