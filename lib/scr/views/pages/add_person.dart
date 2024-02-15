import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? _frequency = '一週間'; // 通知頻度の初期値
  final List<String> _frequencies = ['一週間', '一ヶ月', '三ヶ月', '六ヶ月', '一年']; // 通知頻度の選択肢

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('人物登録'),
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
            icon:const Icon(Icons.done),
            onPressed: () {
              Navigator.pop(
                context,
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
              decoration:const InputDecoration(labelText: '名前', hintText: '山田'),
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
              decoration:const InputDecoration(labelText: '電話番号', hintText: '08012345678'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: 'メールアドレス', hintText: 'yamada@gmail.com'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: '会社名', hintText: '株式会社〇〇'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: '役職', hintText: '〇〇部 部長'),
            ),
            TextFormField(
              decoration:const InputDecoration(labelText: 'メモ'),
              maxLines: 3, // メモ入力欄を複数行に
            ),
          ],
        ),
      ),
    );
  }
}