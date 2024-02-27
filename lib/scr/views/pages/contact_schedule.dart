import 'package:flutter/material.dart';
import '../../bloc/personal_info_bloc.dart';
import '../widgets/cantact_list.dart';
import 'add_person.dart';
import 'package:provider/provider.dart';
import '/scr/models/personal_information.dart';
import 'option.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> with RouteAware {
  List<PersonalInfoItem> items = [];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PersonalInfoBloc>(context, listen: true);
    bloc.loadPersonalInfoItems(); // データを読み込む

    return Scaffold(
      appBar: AppBar(
        title: const Text('予定',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert, size: 32),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OptionPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 32),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonAddPage()),
              ).then((_) => bloc.loadPersonalInfoItems()); // 追加または戻った後にリロード
            },
          ),
        ],
      ),
      body: StreamBuilder<List<PersonalInfoItem>>(
        stream: bloc.personalInfoStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data!;
            final currentMonth = DateTime.now();
            final currentWentMonth =
                (currentMonth.year - 2021) * 12 + currentMonth.month;

            // 今月の予定をフィルタリング
            final List<PersonalInfoItem> thisMonthItems = items.where((item) {
              final difference = currentWentMonth - item.wentMonth!;
              switch (item.notificationTag) {
                case 'everyMonth':
                  return difference > 1;
                case 'everyQuarterYear':
                  return difference > 3;
                case 'everyHarfYear':
                  return difference > 6;
                case 'everyYear':
                  return difference > 12;
                default:
                  return false; // ここには来ないはず
              }
            }).toList();

            // その他の予定
            final List<PersonalInfoItem> otherItems =
                items.where((item) => !thisMonthItems.contains(item)).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SectionTitle(title: '今月の予定'),
                  ...thisMonthItems
                      .map((item) => PersonalInfoTile(infoItem: item, isThisMonth: true))
                      .toList(),
                  const SectionTitle(title: 'その他'),
                  ...otherItems
                      .map((item) => PersonalInfoTile(infoItem: item, isThisMonth: false))
                      .toList(),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
