import 'package:flutter/material.dart';
import 'add_person.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/widgets/cantact_list.dart';

final List<PersonalInfoItem> example = [
  PersonalInfoItem(id: "0",notificationTag: "thisMonth", name: "山田 太郎", companyName: "株式会社サンプル", post: "営業部 部長"),
  PersonalInfoItem(id: "1",notificationTag: "everymonth", name: "佐藤 次郎", companyName: "サンプル株式会社", post: "開発部 部長"),
  PersonalInfoItem(id: "2",notificationTag: "thisMonth", name: "フォークリフト次郎", companyName: "株式会社サンプル", post: "新参部 部長"),

];

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {

  List<PersonalInfoItem> items = [];

  @override
  void initState() {
    super.initState();
    reloadData();
  }

  void reloadData() async {
    final newItems = await DataUtils().loadPersonalInfoItems();
    setState(() {
      items = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
  final List<PersonalInfoItem> thisMonthItems = example
        .where((item) => item.notificationTag == "thisMonth")
        .toList();
  final List<PersonalInfoItem> otherItems = example
        .where((item) => item.notificationTag != "thisMonth")
        .toList();

    return Scaffold(
      appBar: AppBar(
        title:const Text('予定', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,)),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.add, size: 32,),
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonAddPage())
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
            ...thisMonthItems.map((item) => PersonalInfoTile(infoItem: item,)).toList(),
            const SectionTitle(title: 'その他'),
            ...otherItems.map((item) => PersonalInfoTile(infoItem: item,)).toList(),
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

class DataUtils {
  Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
    await loadPersonalInfoItems();
    return [];
  }
}