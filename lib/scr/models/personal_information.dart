import 'package:uuid/uuid.dart';

class PersonalInfoItem {
  final String id;
  final String name;
  final String notificationTag;
  final String? phoneNumber;
  final String? email;
  final String? companyName;
  final String? post;
  final String? note;

  PersonalInfoItem({
    String? id, // idをオプショナルに
    required this.name,
    required this.notificationTag,
    this.phoneNumber,
    this.email,
    this.companyName,
    this.post,
    this.note,
  }) : id = id ?? const Uuid().v4();

  factory PersonalInfoItem.fromJson(Map<String, dynamic> json) => PersonalInfoItem(
        id: json['id'],
        name: json['name'],
        notificationTag: json['notificationTag'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        companyName: json['companyName'],
        post: json['post'],
        note: json['note'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'notificationTag': notificationTag,
        'phoneNumber': phoneNumber,
        'email': email,
        'companyName': companyName,
        'post': post,
        'note': note,
      };
}