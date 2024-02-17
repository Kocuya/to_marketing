import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '/scr/models/personal_information.dart';

Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
  // アプリのドキュメントディレクトリを取得
  final directory = await getApplicationDocumentsDirectory();
  final dataDirectory = Directory(path.join(directory.path, 'scr/datas/'));
  final List<PersonalInfoItem> items = [];

  // ディレクトリが存在するか確認
  if (dataDirectory.existsSync()) {
    // ディレクトリ内のすべてのファイルを取得
    final files = dataDirectory.listSync().where((item) => path.extension(item.path) == '.json');

    for (var file in files) {
      // 各ファイルを読み込み
      final content = await File(file.path).readAsString();
      // JSONをパースしてオブジェクトに変換
      final Map<String, dynamic> jsonData = jsonDecode(content);
      items.add(PersonalInfoItem.fromJson(jsonData));
    }
  }

  return items;
}