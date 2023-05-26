import 'package:askme/shared/Network/Auth.dart';
import 'package:askme/shared/component/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreatePost extends StatelessWidget {
  @override
  final textController = TextEditingController();
  // var formKey = GlobalKey<FormState>();
  Auth auth =Auth();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('FE8235'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Write a Post'),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('FE8235'),
        onPressed: () {
          // formKey.currentState!.validate();
          auth.CreatePost(
              username: data['username'], text: textController.text);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                style: TextStyle(
                  fontSize: 24,
                ),
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  border: InputBorder.none,
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'You should enter text';
                //   }
                //   return null;
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
