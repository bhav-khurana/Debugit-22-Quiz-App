import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/pages/Home/home.dart';
import 'package:quiz_app/pages/authenticate/authenticate.dart';

import '../models/user.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    // print(user);
    //return either home or authenticate
    if (user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
