class Contact {
  final int id;
  final String displayName;
  final String name;
  final int contactFrequencyDays;
  final String? phoneNumber;
  final String? email;
  final String? campanyName;
  final String? job;
  final String? note;

  Contact({
    required this.id,
    required this.displayName,
    required this.name, 
    required this.contactFrequencyDays,
    this.phoneNumber, 
    this.email,
    this.campanyName,
    this.job,
    this.note
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'displayName': displayName,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'contactFrequencyDays': contactFrequencyDays,
    };
  }
}