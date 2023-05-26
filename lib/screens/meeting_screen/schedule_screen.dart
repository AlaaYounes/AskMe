import 'package:askme/shared/Network/Auth.dart';
import 'package:askme/shared/component/Constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../../shared/component/component.dart';

class ScheduleScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var meetingNameController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var time;
  var date;
  Auth auth = Auth();
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
            'Schedule Meeting',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0.15,
        ),
        body: Form(
          key: formKey,
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: defaultFormField(
                  controller: meetingNameController,
                  keyboardType: TextInputType.text,
                  labelText: 'Meeting Name',
                  prefixIcon: Icons.meeting_room_outlined,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a meeting name!';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Time',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: defaultFormField(
                    controller: timeController,
                    keyboardType: TextInputType.datetime,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Time must not be empty';
                      }
                    },
                    labelText: 'Task Time',
                    prefixIcon: Icons.watch_later_outlined,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        time =value!.format(context);
                        timeController.text = value!.format(context).toString();
                      });
                    }),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Date',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: defaultFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'date must not be empty';
                      }
                    },
                    labelText: 'Task Date',
                    prefixIcon: Icons.date_range,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2050-10-01'))
                          .then((value) {
                        date = DateFormat('yyyy-MM-dd').format(value!);
                        dateController.text = DateFormat('yyyy-MM-dd').format(value!);
                      });
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: MaterialButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    auth.createScheduleMeeting(
                        context: context,
                        meetingName: meetingNameController.text,
                        meetingID: roomID,
                        date: dateController.text,
                        time: timeController.text);

                    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                    String formattedTime = DateFormat('HH:mm:ss').format(time);

                    AwesomeNotifications().createNotification(
                      content: NotificationContent(
                        id: 1,
                        channelKey: 'schedule key',
                        title: '${meetingNameController.text}',
                        body: 'Your meeting will start after 1 minute',
                      ),
                      schedule: NotificationCalendar.fromDate(
                          date: DateTime.now().add(Duration(seconds: 5))),
                    );
                    meetingNameController.text =
                        timeController.text = dateController.text = '';

                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: HexColor('FE8235'),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'Schedule',
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
      ),
    );
  }
}
