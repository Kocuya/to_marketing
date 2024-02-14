import 'package:flutter/material.dart';
import '/scr/views/contact_schedule.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansJpTextTheme()
      ),
      home:const SchedulePage(),
    );
  }
}