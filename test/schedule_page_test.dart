import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:to_marketing/scr/bloc/personal_info_bloc.dart';
import 'package:to_marketing/scr/views/pages/contact_schedule.dart';

import 'mocks/mocks_data_utils.dart';

void main() {
  testWidgets('SchedulePage has a title and shows message when there is no data', (WidgetTester tester) async {
    // ProviderとPersonalInfoBlocのモックをセットアップする必要がある場合はここで行います。

    // SchedulePageウィジェットをビルドします。
    await tester.pumpWidget(
      MaterialApp(
        home: Provider<PersonalInfoBloc>(
          create: (context) => MockPersonalInfoBloc(), // モックを提供する
          child: const SchedulePage(),
        ),
      ),
    );

    // AppBarのタイトルが存在するか確認します。
    expect(find.text('予定'), findsOneWidget);

    // データがない場合のメッセージが表示されるか（例：CircularProgressIndicator）を確認します。
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}