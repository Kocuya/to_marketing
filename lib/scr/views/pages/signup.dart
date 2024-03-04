import 'package:flutter/material.dart';
import 'login.dart';
import 'contact_schedule.dart';
import 'debug_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    if (_formKey.currentState!.validate()) {
      if (password == confirmPassword) {
        try {
          // ignore: unused_local_variable
          final UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          // サインアップ成功時の処理
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SchedulePage()),
            (Route<dynamic> route) => false,
          );
        } on FirebaseAuthException catch (e) {
          String errorMessage = 'サインアップに失敗しました。もう一度お試しください。';
          if (e.code == 'weak-password') {
            errorMessage = '提供されたパスワードが弱すぎます。';
          } else if (e.code == 'email-already-in-use') {
            errorMessage = 'メールアドレスは既に使用されています。';
          }
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(errorMessage)));
        } catch (e) {
          print(e); // エラーの詳細をコンソールに表示
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('パスワードが一致しません。')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('サインアップ'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 180),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'メールアドレスを入力してください';
                    }
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return '有効なメールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワードを入力してください';
                    } else if (value.length < 6) {
                      return 'パスワードは6文字以上である必要があります';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'パスワード確認'),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'パスワードが一致しません';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: _signUp,
                  child: const Text('サインアップ',
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DebugPage()));
                  },
                  child: const Text('利用規約',
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text('アカウントをお持ちの方はこちら',
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
              ],
            ),
          ),
        ));
  }
}
