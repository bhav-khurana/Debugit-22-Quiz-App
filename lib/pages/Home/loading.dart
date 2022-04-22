import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map chosenFilters = {};
  Future<void> getQuestions(Map chosenFilters) async {
    Response response = await get(Uri.parse(
        'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=17&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    if (chosenFilters['topicChosen'] == 'Science') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=17&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    } else if (chosenFilters['topicChosen'] == 'Politics') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=24&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    } else if (chosenFilters['topicChosen'] == 'History') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=23&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    } else if (chosenFilters['topicChosen'] == 'Sports') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=21&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    }
    else if (chosenFilters['topicChosen'] == 'General Knowledge') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=9&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    }
    else if (chosenFilters['topicChosen'] == 'Geography') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=22&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    }
    else if (chosenFilters['topicChosen'] == 'Entertainment') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=13&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    }
    else if (chosenFilters['topicChosen'] == 'Mythology') {
      response = await get(Uri.parse(
          'https://opentdb.com/api.php?amount=${chosenFilters['noChosen']}&category=20&difficulty=${chosenFilters['difficultyChosen']}&type=${chosenFilters['typeChosen']}'));
    }
    Map ques = await jsonDecode(response.body);
    print(ques);
    Navigator.pushReplacementNamed(context, '/quiz', arguments: ques);
  }
  @override
  Widget build(BuildContext context) {
    chosenFilters = ModalRoute.of(context)!.settings.arguments as Map;
    getQuestions(chosenFilters);
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  'Fetching some good questions for you \n\n',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  letterSpacing: 1.4,
                  fontFamily: 'Ubuntu',
                ),
              ),
              SpinKitFoldingCube(
                color: Colors.white,
                size: 34.0,
              ),
            ],
          ),
        )
    );
  }
}

