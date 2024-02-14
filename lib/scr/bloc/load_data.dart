import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '/scr/models/personal_information.dart';

Future<List<String>> findJsonFiles() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  final jsonFiles = manifestMap.keys
      .where((String key) => key.startsWith('assets/data/') && key.endsWith('.json'))
      .toList();
  return jsonFiles;
}

Future<List<PersonalInfoItem>> loadPeopleFromFiles(List<String> filePaths) async {
  List<PersonalInfoItem> people = [];
  for (String path in filePaths) {
    final String response = await rootBundle.loadString(path);
    final data = json.decode(response) as List;
    people.addAll(data.map((i) => PersonalInfoItem.fromJson(i)));
  }
  return people;
}