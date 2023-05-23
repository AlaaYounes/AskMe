import 'package:askme/layout/cubit/app_states.dart';
import 'package:askme/layout/cubit/cubit.dart';
import 'package:askme/screens/meeting_screen/schedule_screen.dart';
import 'package:askme/screens/meeting_screen/videocall.dart';
import 'package:askme/shared/component/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart';

import '../../shared/Network/Auth.dart';
import 'create_meeting_screen.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Auth auth = Auth();
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit();
        print('00000000000000000000000000000000000000000');
        print(data.toString());
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartMeeting()));
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
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScheduleScreen()));
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
                            'Schedule Meeting',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Text(
                  'All Sessions',
                  style: TextStyle(
                    color: HexColor('00000'),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: auth.scheduleMeetingHistory,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                      documents = snapshot.data!.docs;
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    itemCount: documents.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, dynamic> dataa =
                          documents[index].data();

                      return SessionCard(
                          meetingName: dataa['meetingName'],
                          time: dataa['Time'],
                          date: dataa['Date'],
                          meetID: dataa['meetingID'],
                          context: context,
                          id: documents[index].id
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget SessionCard({
    required String meetingName,
    required String time,
    required String date,
    required String meetID,
    required context,
    required id,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('FEF3E7'),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${meetingName}',
                        style: TextStyle(
                          color: HexColor('573926'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${meetID}',
                        style: TextStyle(
                          color: HexColor('573926'),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    auth.deleteScheduleMeeting(id);
                  }, icon: Icon(Icons.delete,color: Colors.red,))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range_outlined),
                      Text(
                        ' ${date}',
                        style: TextStyle(
                          color: HexColor('573926'),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.timer_outlined),
                  Text(
                    ' $time',
                    style: TextStyle(
                      color: HexColor('573926'),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoCall(callID: meetID, meetingName: meetingName,)));
                },
                child: Text(
                  'Join Now ',
                  style: TextStyle(
                    color: HexColor('FE8235'),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
