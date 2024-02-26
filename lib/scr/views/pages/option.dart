import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_marketing/scr/views/pages/login.dart';

import '../widgets/option_tile.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        centerTitle: true,
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('エラー'));
          } else if (snapshot.hasData) {
            // ユーザーがログインしている場合
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'ログイン中 : ${snapshot.data!.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                OptionTile(
                  title: 'アップロード',
                  icon: Icons.upload_file,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('仮のため、まだ実装されていません')));
                  },
                ),
                OptionTile(
                  title: 'ダウンロード',
                  icon: Icons.download,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('仮のため、まだ実装されていません')));
                  },
                ),
                OptionTile(
                  title: 'ログアウト',
                  icon: Icons.logout,
                  color: Colors.red,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            );
          } else {
            // ユーザーがログアウトしている場合
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'ログインしていません',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                OptionTile(
                  title: 'ログイン',
                  icon: Icons.login,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
