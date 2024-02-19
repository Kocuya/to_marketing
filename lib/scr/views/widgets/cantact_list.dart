import 'package:flutter/material.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/pages/details_of_item.dart';
import '../../views/pages/login.dart';

class PersonalInfoTile extends StatelessWidget {
  final PersonalInfoItem infoItem;

  const PersonalInfoTile({Key? key, required this.infoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsItemPage(item: infoItem))
        );
      },
      child: ListTile(
        title: Text(
          infoItem.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${infoItem.companyName} - ${infoItem.post}'),
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

class ToDebugPage extends StatelessWidget{
  const ToDebugPage({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const LoginPage())
        );
      },
      child:const Text('*debug* tap this to login page', style: TextStyle(color: Colors.red, fontSize: 20))
    );
  }
}