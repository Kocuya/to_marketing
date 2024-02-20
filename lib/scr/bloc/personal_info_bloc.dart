import 'dart:async';
import '/scr/models/personal_information.dart';
import '/scr/utils/data_utils.dart';

class PersonalInfoBloc {
  final _personalInfoController = StreamController<List<PersonalInfoItem>>.broadcast();

  Stream<List<PersonalInfoItem>> get personalInfoStream => _personalInfoController.stream;

  void loadPersonalInfoItems() async {
    final items = await DataUtils().loadPersonalInfoItems();
    _personalInfoController.sink.add(items);
  }

  // PersonalInfoItemを更新するためのメソッド
  void updatePersonalInfoItem(PersonalInfoItem updatedItem) async {
    List<PersonalInfoItem> items = await DataUtils().loadPersonalInfoItems(); // 現在のアイテムリストをロード
    // アイテムリストの中で更新されたアイテムを見つけて更新
    int index = items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      items[index] = updatedItem;
      _personalInfoController.sink.add(items); // 更新されたアイテムリストをストリームに送信
      
      // 個別にアイテムを保存する処理に変更
      await DataUtils().savePersonalInfoItem(updatedItem); // 単一の更新されたアイテムを永続化
    }
  }

  void dispose() {
    _personalInfoController.close();
  }
}