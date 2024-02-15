import 'package:flutter/material.dart';
import 'item_editing.dart';

class DetailsItemPage extends StatelessWidget {

  const DetailsItemPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('予定詳細'),
        centerTitle: true,
        leading: IconButton(
          icon:const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context,);
          }
        ),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemEditingPage())
              );
            }
          )
        ],
      ),
      body:const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('テストテキスト')
          ],
        )
      )
    );
  }
}