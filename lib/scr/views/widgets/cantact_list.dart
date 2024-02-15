import 'package:flutter/material.dart';
import '/scr/models/personal_information.dart';

class PersonalInfoTile extends StatelessWidget {
  final PersonalInfoItem infoItem;

  const PersonalInfoTile({Key? key, required this.infoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        infoItem.name,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${infoItem.companyName} - ${infoItem.post}'),
    );
  }
}