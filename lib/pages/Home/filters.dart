import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map data = {};

  String Difficulty = '';
  String type = '';
  String NoOfQues = '';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Filters'),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0,30.0,10.0,0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(
                  hint: Text(data['topicChosen'],
                    style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black, fontSize: 16.0),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                  iconSize: 30.0,
                  style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),
                  items: [data['topicChosen']].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        data['topicChosen'] = val as String;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(
                  hint: Difficulty == ''
                      ? const Text('Choose difficulty', style: TextStyle(fontFamily: 'Ubuntu', color: Colors.black, fontSize: 16.0),)
                      : Text(
                    Difficulty,
                    style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black, fontSize: 16.0),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                  iconSize: 30.0,
                  style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),
                  items: ['Easy', 'Medium', 'Hard'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                            Difficulty = val as String;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(
                  hint: type == ''
                      ? const Text('Choose Type of Questions', style: TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),)
                      : Text(
                    type,
                    style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black, fontSize: 16.0),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                  iconSize: 30.0,
                  style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),
                  items: ['Multiple Choice', 'True/False'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                            type = val as String;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(
                  hint: NoOfQues == ''
                      ? const Text('Choose Number of Questions', style: TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),)
                      : Text(
                    NoOfQues,
                    style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black, fontSize: 16.0),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                  iconSize: 30.0,
                  style: const TextStyle(fontFamily: 'Ubuntu',color: Colors.black,fontSize: 16.0),
                  items: ['5','6','7','8','9','10','11','12','13','14','15'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                            NoOfQues = val as String;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 70.0,),
              RaisedButton.icon(onPressed: (){
                Navigator.pushReplacementNamed(context, '/loading', arguments: {
                  'topicChosen': data['topicChosen'],
                  'difficultyChosen': Difficulty.toLowerCase(),
                  'typeChosen': type == 'True/False' ? 'boolean' : 'multiple',
                  'noChosen': NoOfQues,
                });
              },color: Colors.blue[900],padding: EdgeInsets.all(15.0), icon: const Icon(Icons.not_started_outlined, color: Colors.white,), label: const Text('Start the Quiz',style: TextStyle(fontSize: 18.0,fontFamily: 'Ubuntu', color: Colors.white),),)
            ],
          ),
        ),
      ),
    );
  }
}
