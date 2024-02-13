import 'package:flutter/material.dart';
import '/scr/views/widgets/item_widget.dart';

class ThisMonthContactList extends StatelessWidget{
  const ThisMonthContactList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('今月の予定')
        )
        body:const Center(
          child: ItemWidget()
        )
      )
    );
  }
}