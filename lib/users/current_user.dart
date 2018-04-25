import 'package:chatty_chat_chat/users.dart';
import 'package:flutter/foundation.dart';

User currentUser() {
  User user = defaultTargetPlatform == TargetPlatform.android ? User.Puntu : User.Punti;
  return user;
}