import 'package:flutter/material.dart';
import '../../bloc/personal_info_bloc.dart';
import 'add_person.dart';
import 'package:provider/provider.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/widgets/cantact_list.dart';


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
        title: const Text('予定', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
        automaticallyImplyLeading: false,
        actions: <Widget>[
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
            final List<PersonalInfoItem> thisMonthItems = items.where((item) => item.notificationTag == "thisMonth").toList();
            final List<PersonalInfoItem> otherItems = items.where((item) => item.notificationTag != "thisMonth").toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SectionTitle(title: '今月の予定'),
                  ...thisMonthItems.map((item) => PersonalInfoTile(infoItem: item)).toList(),
                  const SectionTitle(title: 'その他'),
                  ...otherItems.map((item) => PersonalInfoTile(infoItem: item)).toList(),
                  const ToDebugPage()
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