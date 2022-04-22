import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  var unescape = HtmlUnescape();
  List<List> optionColor = [[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white],[Colors.white, Colors.white, Colors.white, Colors.white]];
  List enable = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
  List taps = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,];
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int skipped = 0;
  @override
  Widget build(BuildContext context) {
    Map ques = {};
    List question = ['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
    List<List> option = [['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','',''],['','','','']];
    List correct = ['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
    ques = ModalRoute.of(context)!.settings.arguments as Map;
    List quesDisplay = ques['results'];
    for (int i = 0; i < quesDisplay.length; i++) {
      question[i] = quesDisplay[i]['question'];
      int rand = question[i].length;
        option[i][rand%4] = quesDisplay[i]['correct_answer'];
        option[i][(rand%4+1)%4] = quesDisplay[i]['incorrect_answers'][0];
        option[i][(rand%4+2)%4] = quesDisplay[i]['incorrect_answers'][1];
        option[i][(rand%4+3)%4] = quesDisplay[i]['incorrect_answers'][2];
      correct[i] = quesDisplay[i]['correct_answer'];
    }
    // print(ques);

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('${ques['results'][0]['category']} Quiz', style: TextStyle(fontFamily: 'Ubuntu',),),
        centerTitle: true,
          backgroundColor: Colors.blue[900],
      ),
      body: Container(
        // color: Colors.grey,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage('assets/quizbg.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: quesDisplay.length,
                  itemBuilder: (context, index) {
                    // option[index].shuffle();
                    return Container(
                      margin: const EdgeInsets.fromLTRB(0,10.0,0,40.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,

                      ),
                      // color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(unescape.convert(question[index]), style: const TextStyle(fontSize: 19.0,fontFamily: 'Ubuntu',),),
                            ),
                            const SizedBox(height: 10.0,),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: optionColor[index][0],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ListTile(
                                enabled: enable[index],
                                tileColor: optionColor[index][0],
                                onTap: (){
                                  setState(() {
                                    if (option[index][0] == correct[index]) {
                                      optionColor[index][0] = Colors.green;
                                      taps[index] += 1;
                                      enable[index] = false;
                                    }
                                    else {
                                      optionColor[index][0] = Colors.red[200];
                                      taps[index] += 1;
                                    }
                                  });
                                },
                                title: Text(unescape.convert('${option[index][0]}  '), style: TextStyle(fontFamily: 'Ubuntu',),),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: optionColor[index][1],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ListTile(
                                enabled: enable[index],
                                tileColor: optionColor[index][1],
                                onTap: (){
                                  setState(() {
                                    if (option[index][1] == correct[index]) {
                                      optionColor[index][1] = Colors.green;
                                      taps[index] += 1;
                                      enable[index] = false;
                                    }
                                    else {
                                      optionColor[index][1] = Colors.red[200];
                                      taps[index] += 1;
                                    }
                                  });
                                },
                                title: Text(unescape.convert('${option[index][1]}  '), style: TextStyle(fontFamily: 'Ubuntu',),),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: optionColor[index][2],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ListTile(
                                enabled: enable[index],
                                tileColor: optionColor[index][2],
                                onTap: (){
                                  setState(() {
                                    if (option[index][2] == correct[index]) {
                                      optionColor[index][2] = Colors.green;
                                      taps[index] += 1;
                                      enable[index] = false;
                                    }
                                    else {
                                      optionColor[index][2] = Colors.red[200];
                                      taps[index] += 1;
                                    }
                                  });
                                },
                                title: Text(unescape.convert('${option[index][2]}  '), style: TextStyle(fontFamily: 'Ubuntu',),),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: optionColor[index][3],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ListTile(
                                enabled: enable[index],
                                tileColor: optionColor[index][3],
                                onTap: (){
                                  setState(() {
                                    if (option[index][3] == correct[index]) {
                                      optionColor[index][3] = Colors.green;
                                      taps[index] += 1;
                                      enable[index] = false;
                                    }
                                    else {
                                      optionColor[index][3] = Colors.red[200];
                                      taps[index] += 1;
                                    }
                                  });
                                },
                                title: Text(unescape.convert('${option[index][3]}  '), style: TextStyle(fontFamily: 'Ubuntu',),),
                              ),
                            ),
                            const SizedBox(height: 30.0,)
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            ElevatedButton.icon(onPressed: (){
              for (int i = 0; i < quesDisplay.length; i++) {
                if (taps[i] == 0) {skipped += 1;}
                else if (taps[i] == 1) {correctAnswers += 1;}
                else {wrongAnswers += 1;}
              }
              Navigator.pushReplacementNamed(context, '/performance',arguments:{
                'correctNo': correctAnswers,
                'incorrectNo': wrongAnswers,
                'skippedNo': skipped,
                'totalNo': quesDisplay.length,
              });
            }, icon: Icon(Icons.done_rounded), label: Text('Submit', style: TextStyle(fontFamily: 'Ubuntu',),))
          ],
        ),
      ),
    );
  }
}
