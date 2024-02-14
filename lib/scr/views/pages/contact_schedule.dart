import 'package:flutter/material.dart';
import 'add_person.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('予定', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,)),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.add, size: 32,),
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrationPage())
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SectionTitle(title: '今月の予定', ),
            Container(
              height: 300,
              color: Colors.blue[100],
              child:const Align(
                alignment: Alignment.topLeft,
                child: Text('add item', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SectionTitle(title: 'その他'),
            Container(
              height: 1000,
              color: Colors.green[100],
              child:const Align(
                alignment: Alignment.topLeft,
                child: Text('add item', style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              height: 30,
              color: Colors.white,
              child:const Align(
                alignment: Alignment.topRight,
                child: Text('END LIST',style: TextStyle(fontSize: 20), selectionColor: Color.fromARGB(255, 201, 201, 201),),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.event_note, size: 30, color: Colors.black), // アイコンを追加
          const SizedBox(width: 8.0), // アイコンとテキストの間にスペースを追加
          Text(
            title,
            style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
