import 'package:flutter/material.dart';
import '../../models/personal_information.dart';

int calculateWentMonth() {
  final currentDate = DateTime.now();
  return (currentDate.year - 2021) * 12 + currentDate.month - 1;
}

class ItemEditingPage extends StatefulWidget {
  final PersonalInfoItem item;

  const ItemEditingPage({Key? key, required this.item}) : super(key: key);

  @override
  ItemEditingState createState() => ItemEditingState();
}

class ItemEditingState extends State<ItemEditingPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _companyNameController;
  late TextEditingController _positionController;
  late TextEditingController _noteController;
  String? _frequency;

  final List<String> _frequencies = ['everyMonth', 'everyQuarterYear', 'everyHarfYear', 'everyYear'];

  @override
  void initState() {
    super.initState();
    _frequency = widget.item.notificationTag; // 通知頻度の初期値を設定
    _nameController = TextEditingController(text: widget.item.name); // 名前
    _phoneNumberController = TextEditingController(text: widget.item.phoneNumber); // 電話番号
    _emailController = TextEditingController(text: widget.item.email); // メールアドレス
    _companyNameController = TextEditingController(text: widget.item.companyName); // 会社名
    _positionController = TextEditingController(text: widget.item.post); // 役職
    _noteController = TextEditingController(text: widget.item.note); // メモ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定編集'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              bool isNotificationTagChanged = _frequency != widget.item.notificationTag;

              int newWentMonth = isNotificationTagChanged ? calculateWentMonth() : widget.item.wentMonth!;
              
              final updatedItem = PersonalInfoItem(
                id: widget.item.id,
                name: _nameController.text,
                phoneNumber: _phoneNumberController.text,
                email: _emailController.text,
                companyName: _companyNameController.text,
                post: _positionController.text,
                note: _noteController.text,
                notificationTag: _frequency ?? widget.item.notificationTag, // 通知頻度が選択されていない場合、元の値を使用
                wentMonth: newWentMonth,
              );
              Navigator.pop(context, updatedItem);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: '名前', hintText: widget.item.name),
            ),
            DropdownButtonFormField<String>(
              value: _frequency,
              decoration: const InputDecoration(labelText: '通知頻度'),
              items: _frequencies.map<DropdownMenuItem<String>>((String value) {
                String displayValue;
                switch (value) {
                  case 'everyMonth':
                    displayValue = '一ヶ月毎';
                    break;
                  case 'everyQuarterYear':
                    displayValue = '三ヶ月毎';
                    break;
                  case 'everyHarfYear':
                    displayValue = '六ヶ月毎';
                    break;
                  case 'everyYear':
                    displayValue = '一年毎';
                    break;
                  default:
                    displayValue = value; // 予期しない値の場合はそのまま表示
                }
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(displayValue),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _frequency = newValue;
                });
              },
            ),
            // 他のフィールドも同様に設定
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: '電話番号', hintText: widget.item.phoneNumber),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'メールアドレス', hintText: widget.item.email),
            ),
            TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: '会社名', hintText: widget.item.companyName),
            ),
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: '役職', hintText: widget.item.post),
            ),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'メモ', hintText: widget.item.note,),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _companyNameController.dispose();
    _positionController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}