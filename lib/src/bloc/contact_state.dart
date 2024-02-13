import '/src/model/contact.dart';

abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactsLoadingState extends ContactState {}

class ContactsLoadedState extends ContactState {
  final List<Contact> contacts;

  ContactsLoadedState(this.contacts);
}

class ContactErrorState extends ContactState {
  final String message;

  ContactErrorState(this.message);
}