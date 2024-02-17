import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '/scr/models/personal_information.dart';

class DataStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/scr/datas/${DateTime.now().millisecondsSinceEpoch}.json');
  }

  Future<File> savePersonData(PersonalInfoItem data) async {
    final file = await _localFile;
    return file.writeAsString(json.encode(data.toJson()));
  }
}