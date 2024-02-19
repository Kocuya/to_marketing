import 'package:flutter/material.dart';
import 'add_person.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;
import '/scr/models/personal_information.dart';
import '/scr/views/widgets/cantact_list.dart';


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
    try {
      final newItems = await DataUtils().loadPersonalInfoItems();
      if (!mounted) return; // ここでmountedをチェック
      setState(() {
        items = newItems;
      });
    } catch (e) {
      if (!mounted) return; // エラーハンドリング前にもチェック
      // エラーが発生した場合のUI更新やダイアログ表示のコード
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:const Text('エラー'),
          content:const Text('情報を読み込めませんでした。'),
          actions: <Widget>[
            TextButton(
              child:const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  final List<PersonalInfoItem> thisMonthItems = items
        .where((item) => item.notificationTag == "thisMonth")
        .toList();
  final List<PersonalInfoItem> otherItems = items
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

// class DataUtils {
//   Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
//     try {
//       // JSONファイルのパス
//       final String response = await rootBundle.loadString('data/personal_info.json');
//       final data = await json.decode(response);
//       List<PersonalInfoItem> items = List<PersonalInfoItem>.from(data.map((i) => PersonalInfoItem.fromJson(i)));
//       return items;
//     } catch (e) {
//       throw Exception('Failed to load personal info');
//     }
//   }
// }

class DataUtils {
  Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
    // 仮のデータリスト
    List<PersonalInfoItem> items = [
      PersonalInfoItem(id: "0",notificationTag: "thisMonth", name: "山田 太郎", phoneNumber: "08012345678", email: "yamada@example.io", companyName: "株式会社サンプル", post: "営業部 部長", note: ""),
      PersonalInfoItem(id: "1",notificationTag: "other", name: "佐藤 次郎", phoneNumber: "08012345678", email: "sato.base@example.io", companyName: "サンプル株式会社", post: "開発部 部長", note: ""),
      PersonalInfoItem(id: "2",notificationTag: "thisMonth", name: "フォークリフト次郎", phoneNumber: "08012345678", email: "forkknif@example.io", companyName: "株式会社サンプル", post: "新参部 部長", note: ""),
      PersonalInfoItem(id: "3",notificationTag: "other", name: "岸田文雄", phoneNumber: "08037564237", email: "shushojaniyokentousi@naikakuhu.com", companyName: "内閣府", post: "内閣総理大臣 (検討志)", note: "Old geezer shitheads with glasses who will vote immediately to raise taxes but won't consider and do anything important."),
    ];

    // 本番環境ではファイルからの読み込み
    return items;
  }
}