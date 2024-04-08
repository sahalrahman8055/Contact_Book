class ContactModel {
  String? id;
  String? name;
  String? phone;
  String? email;

  ContactModel({required this.id, required this.name, required this.phone, required this.email});

  factory ContactModel.fromMap(Map<String, dynamic> map, String id) {
    return ContactModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email:map['email']??'',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email':email,
      
    };
  }
}
