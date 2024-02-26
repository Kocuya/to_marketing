import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/scr/bloc/personal_info_bloc.dart';
import '/scr/views/pages/contact_schedule.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
        home: const SchedulePage(),
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansJpTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
