import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/scr/bloc/personal_info_bloc.dart';
import '/scr/views/pages/contact_schedule.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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