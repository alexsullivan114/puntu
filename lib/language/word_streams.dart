import 'dart:async';

import 'package:chatty_chat_chat/language/translation.dart';
import 'package:firebase_database/firebase_database.dart';

final reference =
    FirebaseDatabase.instance.reference().child('word_of_the_day');

final englishKey = "english";
final nepaliKey = "nepali";

addWordOfTheDay(Translation wordOfTheDay) {
  reference.push().set({
    englishKey: wordOfTheDay.englishText,
    nepaliKey: wordOfTheDay.nepaliText
  });
}

deleteWordOfTheDay(Translation wordOfTheDay) {
  reference.child(wordOfTheDay.key).remove();
}

Stream<Translation> subscribeToWordsOfTheDay() {
  return reference.onChildAdded.map((event) {
    String nepali = event.snapshot.value[nepaliKey];
    String english = event.snapshot.value[englishKey];
    return Translation(nepali, english, event.snapshot.key);
  });
}

Stream<List<Translation>> subscribeToWordsOfTheDayList() {
  return reference.onValue.map((event) {
    List<Translation> words = [];
    Map<dynamic, dynamic> data = event.snapshot.value;
    data.keys.forEach((key) {
      Map<dynamic, dynamic> wordOfTheDayData = data[key];
      Translation word = Translation(
          wordOfTheDayData[nepaliKey], wordOfTheDayData[englishKey], key);
      words.add(word);
    });
    return words;
  });
}
