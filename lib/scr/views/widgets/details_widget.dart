import 'package:flutter/material.dart';

class LabeledInputField extends StatelessWidget {
  final String label;
  final String title;

  const LabeledInputField({
    Key? key,
    required this.label,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8,),
        Text(
          label,
          style:const TextStyle(fontSize: 14, color: Colors.blueGrey),
        ),
        Text(
          title,
          style:const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}