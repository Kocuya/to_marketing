import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/scr/bloc/personal_info_bloc.dart';
import '/scr/views/pages/contact_schedule.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'scr/views/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialization completed');
  } catch (e) {
    print('Firebase initialization failed with error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<PersonalInfoBloc>(
      create: (context) => PersonalInfoBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MaterialApp(
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // ログイン状態に基づいて表示するページを切り替える
            if (snapshot.connectionState == ConnectionState.active) {
              // ログインしているユーザーがあればスケジュールページを、そうでなければログインページを表示
              return snapshot.hasData ? const SchedulePage() : const LoginPage();
            }
            // 接続中の状態を示すインジケーターを表示
            return const Center(child: CircularProgressIndicator());
          },
        ),
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansJpTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}