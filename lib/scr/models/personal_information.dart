class PersonalInfo{

  final String name;
  final String notificationFrequency;
  final String? phoneNumber;
  final String? emailAddress;
  final String? campanyName;
  final String? post;
  final String? note;

  PersonalInfo({
    required this.name,
    required this.notificationFrequency,
    this.phoneNumber,
    this.emailAddress,
    this.campanyName,
    this.post,
    this.note
  });
  
  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      notificationFrequency: json['notificationFrequency'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      campanyName: json['campanyName'],
      post: json['post'],
      note: json['note']
    );
  }
}