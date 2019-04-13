import 'package:chatty_chat_chat/home/home_widget.dart';
import 'package:chatty_chat_chat/users/current_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

void main() => runApp(new MainWidget());

class MainWidget extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MainWidgetState createState() {
    return new MainWidgetState();
  }
}

class MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white
        ),
        home: new Scaffold(
          body: new HomeWidget(),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) {
        print("onResume: $message");
      },
    );

    _firebaseMessaging.getToken().then((token){
      final reference = FirebaseDatabase.instance.reference().child('tokens/' + currentUser().index.toString());
      reference.set(token);
    });
  }
}
