import 'dart:async';

import 'package:chatty_chat_chat/chat/chat_message.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:chatty_chat_chat/users/current_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

final reference = FirebaseDatabase.instance.reference().child('messages');
final textKey = "text";
final userKey = "user";

sendMessage(String message) {
  reference.push().set({
    textKey: message,
    userKey: currentUser().index,
  });

  defaultTargetPlatform;
}

Stream<ChatMessage> subscribeToMessages() {
  return reference.onChildAdded.map((event) {
    int index = event.snapshot.value[userKey];
    User user = index == 0 ? User.Puntu : User.Punti;
    return ChatMessage(
        event.snapshot.value[textKey],
        user
    );
  });
}