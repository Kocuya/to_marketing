import 'package:flutter/material.dart';
import 'signup.dart';
import 'contact_schedule.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // フォームの状態を管理するためのキー

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ログイン'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form( // Formウィジェットを追加
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              TextFormField(
                decoration: const InputDecoration(label: Text('名前')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '名前を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('メールアドレス')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  String pattern =
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return '有効なメールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('パスワード')),
                obscureText: true, // パスワードを隠す
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  String pattern = r'^[a-zA-Z0-9]+$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return '英数字のみを入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              TextButton(
                child: const Text('確認', style: TextStyle(color: Colors.blue, fontSize: 18)),
                onPressed: () {
                  // フォームのバリデーションを実行
                  if (_formKey.currentState!.validate()) {
                    // フォームが有効な場合、ナビゲーションを実行
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SchedulePage()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
              TextButton(
                child: const Text('アカウントをお持ちでない方はこちら', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}