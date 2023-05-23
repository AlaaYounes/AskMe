import 'package:askme/shared/component/Constants.dart';
import 'package:askme/shared/component/component.dart';
import 'package:askme/screens/meeting_screen/videocall.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StartMeeting extends StatelessWidget {
  var meetingNameController = TextEditingController();
  var meetingIDController = TextEditingController();
  var meetNameKey = GlobalKey<FormState>();
  var meetIdKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: HexColor('FE8235'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
              )),
          title: Text(
            'Create Meeting',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0.15,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Meeting Topic',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: meetNameKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: defaultFormField(
                  controller: meetingNameController,
                  keyboardType: TextInputType.text,
                  hintText: 'MeetingName',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a meeting name!';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Meeting ID',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: meetIdKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: defaultFormField(
                  controller: meetingIDController,
                  keyboardType: TextInputType.number,
                  hintText: '${ VideoCall(
                    callID: roomID, meetingName: '',
                  ).callID}',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a meeting name!';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.5),
                    child: MaterialButton(
                      onPressed: () {
                        if (meetIdKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoCall(
                                      callID: meetingIDController.text, meetingName: meetingNameController.text,)));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: HexColor('FE8235'),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'Join Meeting',
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
                    padding: const EdgeInsets.only(right: 12.5),
                    child: MaterialButton(
                      onPressed: () {
                        if (meetNameKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VideoCall(callID: roomID, meetingName: meetingNameController.text,)));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: HexColor('FE8235'),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'Create Meeting',
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
      ),
    );
  }
}
