import 'package:mockito/mockito.dart';
import 'package:to_marketing/scr/bloc/personal_info_bloc.dart';
import 'package:to_marketing/scr/models/personal_information.dart';


// PersonalInfoBlocのモッククラスを作成
class MockPersonalInfoBloc extends Mock implements PersonalInfoBloc {
  @override
  Stream<List<PersonalInfoItem>> get personalInfoStream => Stream.value([]);
}