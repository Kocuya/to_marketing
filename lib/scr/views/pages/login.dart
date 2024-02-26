import 'package:flutter/material.dart';
import 'signup.dart';
import 'contact_schedule.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      // ignore: unused_local_variable
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // ログイン成功時の処理
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SchedulePage()),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'ログインに失敗しました。もう一度お試しください。';
      if (e.code == 'user-not-found') {
        errorMessage = 'ユーザーが見つかりません。';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'パスワードが間違っています。';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      print(e); // エラーの詳細をコンソールに表示
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ログイン'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(label: Text('メールアドレス')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(label: Text('パスワード')),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              TextButton(
                child: const Text('ログイン',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
              ),
              TextButton(
                child: const Text('アカウントをお持ちでない方はこちら',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
