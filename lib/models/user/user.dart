import '../base_models.dart';

class User extends Model<User> {
  String id, email, password, token;
  bool isChangePassword;

  User({this.id, this.email, this.password, this.token, this.isChangePassword})
      : super({
          'id': id,
          'email': email,
          'password': password,
          'token': token,
          'isChangePassword': isChangePassword
        });

  User copyWith({
    id,
    email,
    password,
    token,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        token: token ?? this.token,
      );

  User.fromJson(Map<String, dynamic> parsedJson) : super({}) {
    email = parsedJson['email'];
    password = parsedJson['password'];
    token = parsedJson['token'];
    isChangePassword = parsedJson['isChangePassword'];
  }
}
