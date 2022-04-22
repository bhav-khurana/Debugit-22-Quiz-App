import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  Map userData = {};
  @override
  Widget build(BuildContext context) {
    userData = ModalRoute.of(context)!.settings.arguments as Map;
    print(userData);
    double percent = double.parse(((userData['correctNo']/userData['totalNo'])*100).toStringAsFixed(2));
    double correctPercent = double.parse(((userData['correctNo']/userData['totalNo'])*100).toStringAsFixed(2));
    double incorrectPercent = double.parse(((userData['incorrectNo']/userData['totalNo'])*100).toStringAsFixed(2));
    double skippedPercent = double.parse(((userData['skippedNo']/userData['totalNo'])*100).toStringAsFixed(2));
    double accuracyPercent = double.parse(((userData['correctNo']/(userData['correctNo']+userData['incorrectNo']))*100).toStringAsFixed(2));
    String remark = '';
    if (percent == 0) remark = 'Oops !';
    else if (percent > 0 && percent < 40) remark = 'Not Bad !';
    else if (percent >= 40 && percent < 70) remark = 'Nicely Done !';
    else if (percent >= 70 && percent < 100) remark = 'Excellent !';
    else remark = 'Perfection !';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Analysis', style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pbg.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            const SizedBox(height: 30.0,),
            Text(
                remark,
              style: const TextStyle(
                fontSize: 30.0,
                letterSpacing: 1.8,
                color: Colors.white,
                fontFamily: 'Ubuntu'
              ),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Center(
                child: CircularPercentIndicator(
                  backgroundColor: Colors.redAccent,
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 150.0,
                  animation: true,
                  animationDuration: 1000,
                  // arcBackgroundColor: Colors.greenAccent,
                  lineWidth: 18.0,
                  percent: userData['correctNo']/userData['totalNo'],
                  center: Text(
                    '$percent %',
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  progressColor: Colors.greenAccent[700],
                ),
              ),
            ),
        SizedBox(height: 25.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            lineHeight: 39.0,
            percent: userData['correctNo']/userData['totalNo'],
            center: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Correct ',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,fontFamily: 'Ubuntu',),
                ),
                Text(
                  '$correctPercent %',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,fontFamily: 'Ubuntu',),
                ),
              ],
            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.greenAccent[700],
            backgroundColor: Colors.grey[300],
          ),
        ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 39.0,
                percent: userData['incorrectNo']/userData['totalNo'],
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Incorrect ',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                    Text(
                      '$incorrectPercent %',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                  ],
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.redAccent[200],
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 39.0,
                percent: userData['skippedNo']/userData['totalNo'],
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skipped ',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                    Text(
                      '$skippedPercent %',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                  ],
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.grey[500],
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 39.0,
                percent: userData['correctNo']/(userData['correctNo']+userData['incorrectNo']),
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Accuracy ',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                    Text(
                      '$accuracyPercent %',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,fontFamily: 'Ubuntu',),
                    ),
                  ],
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.yellow[800],
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 40.0,),
            ElevatedButton.icon(onPressed: (){
              Navigator.pushReplacementNamed(context, '/home');
            }, icon: Icon(Icons.home), label: Text('Take Another Quiz', style: TextStyle(fontFamily: 'Ubuntu'),))
          ],
        ),
      ),
    );
  }
}
