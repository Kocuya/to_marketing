import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '/scr/models/personal_information.dart';

class DataUtils {
  // データを保存するディレクトリのパスを取得
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return path.join(directory.path, 'to_marketing/datas/');
  }

  // データを保存するファイルを指定
  Future<File> _localFile(String fileName) async {
    final localPath = await _localPath;
    return File('$localPath$fileName.json');
  }

  // パーソナル情報をJSONファイルとして保存
  Future<File> savePersonalInfoItem(PersonalInfoItem data) async {
    final localPath = await _localPath;
    final directory = Directory(localPath);

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final file = await _localFile(data.id); // ファイル名をIDに基づいて指定
    return file.writeAsString(json.encode(data.toJson()));
  }

  // 保存されたパーソナル情報を読み込む
  Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
    final List<PersonalInfoItem> items = [];
    try {
      final localPath = await _localPath;
      final dataDirectory = Directory(localPath);

      if (dataDirectory.existsSync()) {
        final files = dataDirectory.listSync().where((item) => path.extension(item.path) == '.json');

        for (var file in files) {
          final content = await File(file.path).readAsString();
          final Map<String, dynamic> jsonData = jsonDecode(content);
          items.add(PersonalInfoItem.fromJson(jsonData));
        }
      }
    } catch (e) {
      // エラーハンドリング: 例外が発生した場合の処理をここに記述
      print("ファイルの読み込み中にエラーが発生しました: $e");
      // 必要に応じて、エラーを上位のレイヤーに伝播させるか、空のリストを返すなどの対応を行う
    }
    return items;
  }
}