import 'package:flutter/material.dart';
import '/scr/models/personal_information.dart';
import '/scr/bloc/data_storage.dart';

int calculateWentMonth() {
  final currentDate = DateTime.now();
  return (currentDate.year - 2021) * 12 + currentDate.month - 1;
}

class PersonAddPage extends StatefulWidget {
  const PersonAddPage({super.key});

  @override
  PersonAddPageState createState() => PersonAddPageState();
}

class PersonAddPageState extends State<PersonAddPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _companyName = '';
  String _post = '';
  String _note = '';
  String _notificationTag = 'everyMonth';
  final int _wentMonth = calculateWentMonth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('人物追加'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                // PersonalInfoItemのインスタンス生成時にwentMonthも設定
                PersonalInfoItem personalInfoItem = PersonalInfoItem(
                  name: _name,
                  notificationTag: _notificationTag,
                  phoneNumber: _phoneNumber,
                  email: _email,
                  companyName: _companyName,
                  post: _post,
                  note: _note,
                  wentMonth: _wentMonth, // wentMonthを設定
                );

                final storage = DataStorage();

                try {
                  await storage.savePersonData(personalInfoItem);
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('データを保存しました')),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  print('保存に失敗しました');
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('データの保存に失敗しました')),
                  );
                }
              } else {
                scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('*は入力必須です')),
                );
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding:const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:const InputDecoration(
                  labelText: '名前 *',
                  hintText: '名前を入力してください',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*は入力必須です';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              DropdownButtonFormField(
                value: _notificationTag,
                decoration:const InputDecoration(
                  labelText: '通知頻度',
                ),
                items: ['everyMonth', 'everyQuarterYear', 'everyHarfYear', 'everyYear']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _notificationTag = newValue!;
                  });
                },
              ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: '電話番号',
                  hintText: '電話番号を入力してください',
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _phoneNumber = value!,
              ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: 'メールアドレス',
                  hintText: 'メールアドレスを入力してください',
                ),
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: '会社名',
                  hintText: '会社名を入力してください',
                ),
                onSaved: (value) => _companyName = value!,
              ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: '役職',
                  hintText: '役職を入力してください',
                ),
                onSaved: (value) => _post = value!,
              ),
              TextFormField(
                maxLines: 3,
                decoration:const InputDecoration(
                  labelText: 'メモ',
                  hintText: 'メモを入力してください',
                ),
                onSaved: (value) => _note = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}