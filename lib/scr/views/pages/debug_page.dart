import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget{
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('デバッグ'),
        centerTitle: true,
      ),
    );
  }
}