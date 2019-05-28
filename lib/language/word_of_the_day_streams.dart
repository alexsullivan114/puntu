import 'dart:async';

import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:firebase_database/firebase_database.dart';

final reference =
    FirebaseDatabase.instance.reference().child('word_of_the_day');

final englishKey = "english";
final nepaliKey = "nepali";

addWordOfTheDay(WordOfTheDay wordOfTheDay) {
  reference.push().set({
    englishKey: wordOfTheDay.englishText,
    nepaliKey: wordOfTheDay.nepaliText
  });
}

deleteWordOfTheDay(WordOfTheDay wordOfTheDay) {
  reference.child(wordOfTheDay.key).remove();
}

Stream<WordOfTheDay> subscribeToWordsOfTheDay() {
  return reference.onChildAdded.map((event) {
    String nepali = event.snapshot.value[nepaliKey];
    String english = event.snapshot.value[englishKey];
    return WordOfTheDay(nepali, english, event.snapshot.key);
  });
}

Stream<List<WordOfTheDay>> subscribeToWordsOfTheDayList() {
  return reference.onValue.map((event) {
    List<WordOfTheDay> words = [];
    Map<dynamic, dynamic> data = event.snapshot.value;
    data.keys.forEach((key) {
      Map<dynamic, dynamic> wordOfTheDayData = data[key];
      WordOfTheDay word = WordOfTheDay(
          wordOfTheDayData[nepaliKey], wordOfTheDayData[englishKey], key);
      words.add(word);
    });
    return words;
  });
}
