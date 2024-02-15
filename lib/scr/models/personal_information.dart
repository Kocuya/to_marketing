class PersonalInfoItem {
  final String id;
  final String name;
  final String notificationTag;
  final int notificationFrequency;
  final String? phoneNumber;
  final String? email;
  final String? companyName;
  final String? post;
  final String? memo;

  PersonalInfoItem({
    required this.id,
    required this.name,
    required this.notificationTag,
    required this.notificationFrequency,
    this.phoneNumber,
    this.email,
    this.companyName,
    this.post,
    this.memo,
  });

  factory PersonalInfoItem.fromJson(Map<String, dynamic> json) => PersonalInfoItem(
        id: json['id'],
        name: json['name'],
        notificationTag: json['notificationTag'],
        notificationFrequency: json['notificationFrequency'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        companyName: json['companyName'],
        post: json['post'],
        memo: json['memo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'notificationTag': notificationTag,
        'notificationFrequency': notificationFrequency,
        'phoneNumber': phoneNumber,
        'email': email,
        'companyName': companyName,
        'post': post,
        'memo': memo,
      };
}