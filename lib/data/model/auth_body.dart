
import '../utils/from_one_to_another.dart';

class AuthBody with ToJsonData{
  String? inn;
  String? email;
  String password;

  AuthBody(this.inn, this.email, this.password);

  @override
  Map<String, dynamic> toJsonData() {
    final type = email != null ? "Email" : "INN";
    return {
      "type" : type,
      "innOrEmail": inn ?? email,
      "password": password
    };
  }

}