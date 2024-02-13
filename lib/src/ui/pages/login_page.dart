import 'package:flutter/material.dart';
import '/src/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      bool loggedIn = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );

      if (loggedIn) {
        // ログイン成功時の処理
        // 例: ホームページに遷移
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        // ログイン失敗時の処理
        // 例: エラーメッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ログインに失敗しました。メールアドレスまたはパスワードが正しくありません。')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'メールアドレス'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'メールアドレスを入力してください';
                }
                // 他のバリデーションロジックを追加することも可能
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'パスワード'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'パスワードを入力してください';
                }
                // 他のバリデーションロジックを追加することも可能
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('ログイン'),
            ),
            TextButton(
              onPressed: () {
                // サインアップページへの遷移
                Navigator.of(context).pushNamed('/signup.dart');
              },
              child: Text('アカウントを持っていない方はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}