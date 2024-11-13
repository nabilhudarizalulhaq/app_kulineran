class LoginResponse {
  final String token;
  final User user;

  LoginResponse({required this.token, required this.user});

  // From JSON (deserialization)
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'], // Token is a String
      user: User.fromJson(json['user']), // User is a User object
    );
  }

  // To JSON (serialization)
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}


class User {
  final int id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? fullName;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.fullName,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  // function create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      fullName: json['full_name'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  get user => null;

  get token => null;

  // fonction change User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
