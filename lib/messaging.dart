import 'dart:async';

import 'package:chatty_chat_chat/chat_message.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

final reference = FirebaseDatabase.instance.reference().child('messages');
final textKey = "text";
final userKey = "user";

sendMessage(String message) {

  User user = defaultTargetPlatform == TargetPlatform.android ? User.A : User.B;

  reference.push().set({
    textKey: message,
    userKey: user.index,
  });

  defaultTargetPlatform;
}

Stream<ChatMessage> subscribeToMessages() {
  return reference.onChildAdded.map((event) {
    int index = event.snapshot.value[userKey];
    User user = index == 0 ? User.A : User.B;
    return new ChatMessage(
        event.snapshot.value[textKey],
        user
    );
  });
}