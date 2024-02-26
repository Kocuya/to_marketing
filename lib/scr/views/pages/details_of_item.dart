import 'package:flutter/material.dart';
import 'package:to_marketing/scr/models/personal_information.dart';
import 'item_editing.dart';
import '/scr/views/widgets/details_widget.dart';
import '/scr/bloc/data_storage.dart';

class DetailsItemPage extends StatefulWidget {
  final PersonalInfoItem item;

  const DetailsItemPage({Key? key, required this.item}) : super(key: key);

  @override
  DetailsItemPageState createState() => DetailsItemPageState();
}

class DetailsItemPageState extends State<DetailsItemPage> {
  late PersonalInfoItem item;

  @override
  void initState() {
    super.initState();
    // 初期化時に渡されたアイテムで状態を初期化
    item = widget.item;
  }

  DataStorage dataStorage = DataStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定詳細'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              // ItemEditingPageから更新されたアイテムを受け取る
              final updatedItem = await Navigator.push<PersonalInfoItem>(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemEditingPage(item: item),
                ),
              );
              // 更新されたアイテムがあれば、状態を更新
              if (updatedItem != null) {
                setState(() {
                  item = updatedItem;
                });
                await DataStorage().savePersonData(item);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  Text(item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text('${item.companyName}   ${item.post}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 46),
            LabeledInputField(
              label: '通知頻度',
              title: item.notificationTag,
            ),
            LabeledInputField(
              label: '電話番号',
              title: '${item.phoneNumber}',
            ),
            LabeledInputField(
              label: 'メールアドレス',
              title: '${item.email}',
            ),
            LabeledInputField(
              label: '会社名',
              title: '${item.companyName}',
            ),
            LabeledInputField(
              label: '役職',
              title: '${item.post}',
            ),
            LabeledInputField(
              label: 'メモ',
              title: '${item.note}',
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  await DataStorage().deletePersonData(item);
                  Navigator.pop(context);
                }, 
                child:const Text('削除', style: TextStyle(color: Colors.red, fontSize: 20))
              )
            )
          ],
        ),
      ),
    );
  }
}