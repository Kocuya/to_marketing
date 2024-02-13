import '/src/model/contact.dart';

abstract class ContactEvent {}

class LoadContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent(this.contact);
}

class UpdateContactEvent extends ContactEvent {
  final Contact contact;

  UpdateContactEvent(this.contact);
}

class DeleteContactEvent extends ContactEvent {
  final int contactId;

  DeleteContactEvent(this.contactId);
}
