import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class PersonalInfo {
  // PersonalInfoクラスの定義をここに記述
  PersonalInfo.fromJson(Map<String, dynamic> json) {
    // JSONからオブジェクトを初期化
  }
}

Future<List<PersonalInfo>> loadPersonalInfosFromDirectory() async {
  final dir = await getApplicationDocumentsDirectory();
  final directory = Directory('${dir.path}/scr/data/');
  List<FileSystemEntity> files = directory.listSync();
  List<PersonalInfo> personalInfos = [];

  for (FileSystemEntity file in files) {
    if (file.path.endsWith('.json')) {
      final jsonString = await File(file.path).readAsString();
      final jsonResponse = json.decode(jsonString);
      personalInfos.add(PersonalInfo.fromJson(jsonResponse));
    }
  }
  return personalInfos;
}