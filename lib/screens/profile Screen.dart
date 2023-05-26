import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/component/Constants.dart';

class ProfileScreen extends StatelessWidget {
  Map user;

  ProfileScreen(this.user);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: HexColor('FE8235'),
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            width: 180,
            height: 180,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
            ),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage('images/avatar.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Name: ${user['username']}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text('Email: ${user['email']}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15,),
          Text('Job : ${user['job']}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
