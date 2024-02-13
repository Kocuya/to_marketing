import '../model/contact.dart';
import '../services/database_service.dart';

class ContactRepository {
  final DatabaseService databaseService;

  ContactRepository(this.databaseService);

  Future<List<Contact>> getAllContacts() async {
    // データベースからすべての連絡先を取得
    return getAllContacts();
  }

  Future<void> insertContact(Contact contact) async {
    // データベースに連絡先を追加
  }

  // 他のCRUD操作
}