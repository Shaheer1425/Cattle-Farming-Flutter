import 'package:cattlefarming/Models/notificationClass.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationRecord> notifications = [
    NotificationRecord(
        notificationName: 'Fodder Stock',
        notification: 'Choker is About to End. Please add more Stock.'),
    NotificationRecord(
        notificationName: 'Vaccination',
        notification: 'C14F is not vaccinated yet.'),
    NotificationRecord(
        notificationName: 'Temperature',
        notification:
            'The room temperature has increased beyond the desired level. Please maintain it.'),
  ];

  String userName = 'Mazhar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15.0, left: 5, right: 5, bottom: 10),
            child: Container(
                width: 330,
                height: 80,
                decoration: BoxDecoration(
                    color: Color(0xFFECF7F9),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 13),
                      child: Text(
                        'Hello $userName',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 5),
                      child: Text(
                        'Welcome to notification center!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(notifications[index].notificationName),
                      subtitle: Text(notifications[index].notification),
                      leading: Icon(
                        Icons.notifications,
                        color: Color(0xFF039BA8),
                      ),
                      onTap: () {
                        // Handle tapping on the notification
                        print(
                            'Tapped on notification: ${notifications[index]}');
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
