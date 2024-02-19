import 'dart:async';
import '/scr/models/personal_information.dart';
import '/scr/utils/data_utils.dart'; // DataUtilsのパスを適宜調整してください。

class PersonalInfoBloc {
  final _personalInfoController = StreamController<List<PersonalInfoItem>>.broadcast();

  Stream<List<PersonalInfoItem>> get personalInfoStream => _personalInfoController.stream;

  void loadPersonalInfoItems() async {
    final items = await DataUtils().loadPersonalInfoItems();
    _personalInfoController.sink.add(items);
  }

  void dispose() {
    _personalInfoController.close();
  }
}