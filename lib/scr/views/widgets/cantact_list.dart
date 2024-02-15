import 'package:flutter/material.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/pages/details_of_item.dart';

class PersonalInfoTile extends StatelessWidget {
  final PersonalInfoItem infoItem;

  const PersonalInfoTile({Key? key, required this.infoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsItemPage())
        );
      },
      child: ListTile(
        title: Text(
          infoItem.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${infoItem.companyName} - ${infoItem.post}'),
      ),
    );
  }
}