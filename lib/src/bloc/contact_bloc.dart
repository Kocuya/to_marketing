import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/contact_repository.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(ContactInitialState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactsLoadingState());
      try {
        final contacts = await contactRepository.getAllContacts();
        emit(ContactsLoadedState(contacts));
      } catch (e) {
        emit(ContactErrorState(e.toString()));
      }
    });

    // 他のイベントハンドラー
  }
}