import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeLoad extends StatelessWidget {
  const HomeLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Logging you in \n\n',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  letterSpacing: 1.4,
                  fontFamily: 'Ubuntu',
                ),
              ),
              SpinKitFoldingCube(
                color: Colors.white,
                size: 30.0,
              ),
            ],
          ),
        )
    );;
  }
}
