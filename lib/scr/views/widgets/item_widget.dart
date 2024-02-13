import 'package:flutter/material.dart';
import 'package:to_marketing/scr/models/personal_information.dart';
import '/scr/views/contact_schedule.dart';

class ItemWidget extends StatelessWidget{
  const ItemWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(16.0),
      child: Text(
        PersonalInfo.name,
        style:const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        )
      )
    );
  }
}