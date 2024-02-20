import 'package:flutter/material.dart';
import 'login.dart';
import 'contact_schedule.dart';
import 'debug_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // フォームの状態を管理するためのキー
  final _passwordController = TextEditingController(); // パスワードの入力を管理するコントローラー

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('サインイン'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form( // Formウィジェットを追加
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 180),
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
                controller: _passwordController, // パスワードのコントローラーを設定
                decoration: const InputDecoration(label: Text('パスワード')),
                obscureText: true, // パスワードを隠す
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }else if(value.length < 5){
                    return 'パスワードは5文字以上である必要があります';
                  }
                  String pattern = r'^[a-zA-Z0-9]+$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'パスワードには英数字のみ使用できます';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('確認パスワード')),
                obscureText: true, // パスワードを隠す
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'パスワードが一致しません';
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
                child: const Text('利用規約', style: TextStyle(color: Colors.blue, fontSize: 18)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DebugPage()));
                },
              ),
              TextButton(
                child: const Text('アカウントをお持ちの方はこちら', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}