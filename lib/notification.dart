import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              AwesomeNotifications().requestPermissionToSendNotifications();
            },
            child: Text('Request'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'basic key',
                  title: 'test title',
                  body: 'test body notifications',
                ),
              );
            },
            child: Text('create'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'schedule key',
                  title: 'schedule title',
                  body: 'you have a meeting after 3 seconds',
                ),
                schedule: NotificationCalendar.fromDate(
                    date: DateTime.now().add(Duration(seconds: 3))),
              );
            },
            child: Text('schedule'),
          ),
        ],
      ),
    );
  }
}
