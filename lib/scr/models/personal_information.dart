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
  int? wentMonth;

  PersonalInfoItem({
    String? id,
    required this.name,
    required this.notificationTag,
    this.phoneNumber,
    this.email,
    this.companyName,
    this.post,
    this.note,
    int? wentMonth,
  })  : id = id ?? const Uuid().v4(),
        wentMonth = wentMonth ?? 0;

  factory PersonalInfoItem.fromJson(Map<String, dynamic> json) =>
      PersonalInfoItem(
        id: json['id'],
        name: json['name'],
        notificationTag: json['notificationTag'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        companyName: json['companyName'],
        post: json['post'],
        note: json['note'],
        wentMonth: json['wentMonth'],
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
        'wentMonth': wentMonth,
      };

  PersonalInfoItem copyWith({
    String? id,
    String? name,
    String? companyName,
    String? post,
    String? notificationTag,
    int? wentMonth,
  }) {
    return PersonalInfoItem(
      id: id ?? this.id,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      post: post ?? this.post,
      notificationTag: notificationTag ?? this.notificationTag,
      wentMonth: wentMonth ?? this.wentMonth,
    );
  }
}
