import 'package:flutter/material.dart';
import 'widgets/cantact_list.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ThisMonthContactList(),
            OthersContactList(),
          ],
        )
      )
    );
  }
}