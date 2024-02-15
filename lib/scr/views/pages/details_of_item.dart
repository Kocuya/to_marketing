import 'package:flutter/material.dart';
import '/scr/views/pages/item_editing.dart';

class DetailsItemPage extends StatefulWidget {
  const DetailsItemPage({super.key});

  @override
  DetailsItemState createState() => DetailsItemState();
}

class DetailsItemState extends State<DetailsItemPage> {
  String? _frequency = '一週間'; // 通知頻度の初期値
  final List<String> _frequencies = ['一週間', '一ヶ月', '三ヶ月', '六ヶ月', '一年']; // 通知頻度の選択肢

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('予定詳細'),
        centerTitle: true,
        leading: IconButton(
          icon:const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemEditingPage())
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration:const InputDecoration(labelText: '名前', hintText: '名前を入力してください'),
            ),
            DropdownButtonFormField(
              value: _frequency,
              decoration:const InputDecoration(labelText: '通知頻度'),
              items: _frequencies.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _frequency = newValue;
                });
              },
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: '電話番号', hintText: '電話番号を入力してください'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: 'メールアドレス', hintText: 'メールアドレスを入力してください'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: '会社名', hintText: '会社名を入力してください'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: '役職', hintText: '役職を入力してください'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: 'メモ', hintText: 'メモを入力してください'),
              maxLines: 3, // メモ入力欄を複数行に
            ),
          ],
        ),
      ),
    );
  }
}