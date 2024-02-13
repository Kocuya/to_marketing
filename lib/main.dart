import 'package:flutter/material.dart';
import 'src/ui/pages/login_page.dart';
import 'src/services/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc/contact_bloc.dart';
import 'src/repository/contact_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '連絡先管理アプリ',
      home: BlocProvider(
        create: (context) => ContactBloc(ContactRepository(DatabaseService())),
        child: LoginPage(),
      ),
    );
  }
}