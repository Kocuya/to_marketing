import 'package:flutter/material.dart';
import 'add_person.dart';
import '/scr/models/personal_information.dart';

final List<PersonalInfoItem> example = [
  PersonalInfoItem(id: "0",notificationTag: "everyWeek",notificationFrequency: 1,name: "山田 太郎", companyName: "株式会社サンプル", post: "営業部 部長"),
  PersonalInfoItem(id: "1",notificationTag: "everymonth",notificationFrequency: 1,name: "佐藤 次郎", companyName: "サンプル株式会社", post: "開発部 部長"),
  // 他にも必要に応じて追加
];

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SectionTitle(title: '今月の予定'),
            ...example.map((infoItem) => PersonalInfoTile(infoItem: infoItem)).toList(),
            const SectionTitle(title: 'その他')
          ],
        )
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


class PersonalInfoTile extends StatelessWidget {
  final PersonalInfoItem infoItem;

  const PersonalInfoTile({Key? key, required this.infoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        infoItem.name,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${infoItem.companyName} - ${infoItem.post}'),
    );
  }
}