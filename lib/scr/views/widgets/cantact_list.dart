import 'package:flutter/material.dart';

class ThisMonthContactList extends StatelessWidget{
  const ThisMonthContactList({super.key, Scaffold? home});
  @override
  Widget build(BuildContext context){
    return ThisMonthContactList(
      home: Scaffold(
        body: ListView()
      )
    );
  }
}

class OthersContactList extends StatelessWidget{
  const OthersContactList({super.key, Scaffold? home});
  @override
  Widget build(BuildContext context){
    return OthersContactList(
      home: Scaffold(
        body: ListView()
      )
    );
  }
}