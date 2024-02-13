import 'package:flutter/material.dart';
import '/src/services/auth_service.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      bool signedUp = await _authService.signUp(
        _emailController.text,
        _passwordController.text,
      );
      if (signedUp) {
        // サインアップ成功時の処理。例: ログインページへ遷移
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // サインアップ失敗時の処理。例: エラーメッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('アカウントの作成に失敗しました。')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サインアップ'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: '名前'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '名前を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'メールアドレス'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'メールアドレスを入力してください';
                }
                // 簡単なメール形式のバリデーション
                if (!value.contains('@')) {
                  return '有効なメールアドレスを入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'パスワード'),
              obscureText: true, // パスワードを隠す
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'パスワードを入力してください';
                }
                if (value.length < 6) {
                  return 'パスワードは6文字以上で入力してください';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _signup,
              child: Text('サインアップ'),
            ),
            TextButton(
              onPressed: () {
                // ログインページへの遷移
                Navigator.of(context).pushNamed('/login');
              },
              child: Text('既にアカウントを持っていますか？ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}