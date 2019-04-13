import 'dart:async';

import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:firebase_database/firebase_database.dart';

final reference = FirebaseDatabase.instance.reference().child('word_of_the_day');

final englishKey = "english";
final nepaliKey = "nepali";

addWordOfTheDay(WordOfTheDay wordOfTheDay) {
  reference.push().set({
    englishKey: wordOfTheDay.englishText,
    nepaliKey: wordOfTheDay.nepaliText
  });
}


Stream<WordOfTheDay> subscribeToWordsOfTheDay() {
  return reference.onChildAdded.map((event) {
    String nepali = event.snapshot.value[nepaliKey];
    String english = event.snapshot.value[englishKey];
    return WordOfTheDay(nepali, english);
  });
}