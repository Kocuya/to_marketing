import 'package:flutter/material.dart';
import 'package:to_marketing/scr/models/personal_information.dart';
import 'item_editing.dart';

class DetailsItemPage extends StatelessWidget {
final PersonalInfoItem item;

  const DetailsItemPage({Key? key, required this.item}) : super(key: key);

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50,),
            Text(item.name, style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${item.companyName} ${item.post}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            Text(item.notificationTag, style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('${item.phoneNumber}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('${item.email}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('${item.companyName}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('${item.post}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('${item.note}', style:const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}