import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_marketing/scr/bloc/personal_info_bloc.dart';
import 'package:to_marketing/scr/views/pages/add_person.dart';
import '../../bloc/data_storage.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/pages/details_of_item.dart';

class PersonalInfoTile extends StatefulWidget {
  final PersonalInfoItem infoItem;
  final bool isThisMonth;

  const PersonalInfoTile({Key? key, required this.infoItem, required this.isThisMonth}) : super(key: key);

  @override
  PersonalInfoTileState createState() => PersonalInfoTileState();
}

class PersonalInfoTileState extends State<PersonalInfoTile> {
  bool _isDone = false;

  Color getColorForNotificationTag(String notificationTag) {
    switch (notificationTag) {
      case 'everyMonth':
        return Colors.lightBlue; // 水色
      case 'everyQuarterYear':
        return Colors.orange; // オレンジ
      case 'everyHarfYear':
        return Colors.green; // 緑
      case 'everyYear':
        return Colors.red; // 赤
      default:
        return Colors.grey; // デフォルトの色
    }
  }

  String getJapanese(String notificationTag) {
    switch (notificationTag) {
      case 'everyMonth':
        return '一ヶ月毎'; // 水色
      case 'everyQuarterYear':
        return '三ヶ月毎'; // オレンジ
      case 'everyHarfYear':
        return '六ヶ月毎'; // 緑
      case 'everyYear':
        return '　一年毎'; // 赤
      default:
        return 'その他'; // デフォルトの色
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PersonalInfoBloc>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 227, 227, 227), width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsItemPage(item: widget.infoItem)),
            ).then((_) => bloc.loadPersonalInfoItems());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.infoItem.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${widget.infoItem.companyName}   ${widget.infoItem.post}',
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: getColorForNotificationTag(
                                widget.infoItem.notificationTag),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.notifications,
                                  color: Colors.white, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                getJapanese(widget.infoItem.notificationTag),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(widget.isThisMonth)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _isDone
                          ? const Color.fromARGB(255, 245, 255, 245)
                          : const Color.fromARGB(255, 246, 246, 246),
                      border: Border.all(
                          color: _isDone ? Colors.green : Colors.grey,
                          width: 1.4),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.done,
                          color: _isDone ? Colors.green : Colors.grey),
                      onPressed: () async {
                        setState(() {
                          _isDone = true;
                        });
                        if (_isDone = true) {
                          await Future.delayed(const Duration(seconds: 1));
                          widget.infoItem.wentMonth = calculateWentMonth();
                          final dataStorage = DataStorage();
                          await dataStorage.savePersonData(widget.infoItem);
                          bloc.updatePersonalInfoItem(widget.infoItem);
                          bloc.loadPersonalInfoItems();
                        }
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: <Widget>[
          const Icon(Icons.event_note,
              size: 34, color: Colors.black), // アイコンを追加
          const SizedBox(width: 8.0), // アイコンとテキストの間にスペースを追加
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
