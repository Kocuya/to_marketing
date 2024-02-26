import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '/scr/models/personal_information.dart';

class DataStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return path.join(directory.path, 'to_marketing/datas/');
  }

  Future<File> _localFile(String id) async {
    final localPath = await _localPath;
    return File('$localPath$id.json');
  }

  Future<File> savePersonData(PersonalInfoItem personalInfoItem) async {
    final id = personalInfoItem.id;
    final file = await _localFile(id);

    // ディレクトリの存在を確認し、存在しなければ作成
    final directory = await Directory(path.dirname(file.path));
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // PersonalInfoItemオブジェクトをJSONに変換して保存
    return file.writeAsString(json.encode(personalInfoItem.toJson()));
  }

  Future<void> deletePersonData(PersonalInfoItem personalInfoItem) async {
    final file = await _localFile(personalInfoItem.id);
  
    if (await file.exists()) {
      await file.delete();
      print("ファイルが削除されました: ${file.path}");
    } else {
      print("削除するファイルが見つかりません: ${file.path}");
    }
  }
}