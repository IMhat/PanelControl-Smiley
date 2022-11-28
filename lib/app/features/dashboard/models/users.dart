import 'dart:convert';


class Users {
  final String email;
  final String name;
  

  Users({
    required this.email,
    required this.name,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      
     
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
     
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source));
}
