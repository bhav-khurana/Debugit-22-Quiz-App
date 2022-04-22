import 'package:flutter/material.dart';
import 'package:quiz_app/services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  List topics =  [
    {'name': 'Science', 'image': 'assets/science.jpg'},
    {'name': 'Politics', 'image': 'assets/politics.jpg'},
    {'name': 'History', 'image': 'assets/history.jpg'},
    {'name': 'Sports', 'image': 'assets/sports.jpg'},
    {'name': 'General Knowledge', 'image': 'assets/gk.jpg'},
    {'name': 'Geography', 'image': 'assets/geography.jpg'},
    {'name': 'Entertainment', 'image': 'assets/entertainment.jpg'},
    {'name': 'Mythology', 'image': 'assets/mythology.jpg'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What would you like to test today?', style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.w600, ),),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pbg.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(7.0),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/filters', arguments: {
                              'topicChosen': topics[index]['name']
                            });
                          },
                          title: Text(topics[index]['name'], style: TextStyle(fontFamily: 'Ubuntu',fontSize: 18.0, fontWeight: FontWeight.w600)),
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(topics[index]['image']),
                          ),
                        ),
                      ),
                    ),
                  );
                }
    ),
            ),
            ElevatedButton.icon(onPressed: () async {
              await _auth.signOut();
            }, icon: Icon(Icons.logout), label: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
