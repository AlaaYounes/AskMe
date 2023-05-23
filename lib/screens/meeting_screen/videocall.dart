import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../shared/component/Constants.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({Key? key, required this.callID, required this.meetingName})
      : super(key: key);
  final String callID;
  final String meetingName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('FE8235'),
          title: Row(
            children: [
              Text('$meetingName',
              style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(
                width: 10,
              ),
              Text('MeetID: ${callID}'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: callID));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Title copied to clipboard')));
              },
              icon: Icon(
                Icons.copy,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ZegoUIKitPrebuiltCall(
          appID:
              1129800467, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
          appSign:
              'ff4be0d4bbba01115a3ee82d05d8b9f94e2c66ff7c09a54773f7548d9c4b32db', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
          userID: uid,
          userName: data['username'],
          callID: callID,
          // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
