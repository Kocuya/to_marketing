import 'package:flutter/material.dart';
import 'scr/views/pages/contact_schedule.dart';
import 'package:google_fonts/google_fonts.dart';
import '/scr/bloc/load_data.dart';
import '/scr/models/personal_information.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  final items = await loadPersonalInfoItems();
  runApp(MyApp(items: items));
}

class MyApp extends StatelessWidget {
  final List<PersonalInfoItem> items;
  const MyApp({super.key, required this.items});

  
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