import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/pages/Home/home.dart';
import 'package:quiz_app/pages/Home/filters.dart';
import 'package:quiz_app/pages/Home/quiz.dart';
import 'package:quiz_app/pages/Home/performance.dart';
import 'package:quiz_app/pages/Home/loading.dart';
import 'package:quiz_app/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/services/auth.dart';

void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(StreamProvider<MyUser?>.value(
        initialData: null,
        value: AuthService().user,
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'Ubuntu'),
            initialRoute: '/wrapper',
            routes: {
                  '/wrapper': (context) => Wrapper(),
                  '/home': (context) => Home(),
                  '/filters': (context) => Filter(),
                  '/loading': (context) => Loading(),
                  '/quiz': (context) => Quiz(),
                  '/performance': (context) => Performance()
            }
        ),
      ));
}