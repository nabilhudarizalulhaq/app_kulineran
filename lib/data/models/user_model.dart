class DataUser {
  final List<UserModel> data;
  DataUser({
    required this.data,
  });
  factory DataUser.formJson(Map<String, dynamic> json) =>
      DataUser(data: List.from(json['data'].map((user)=> UserModel.formModel(user))));
}

class UserModel {
  final int id;
  final String firstName;
  final String email;
  final String avatar;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    required this.avatar,
  });

  factory UserModel.formModel(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['first_name'],
      email: json['email'],
      avatar: json['avatar']);
}
