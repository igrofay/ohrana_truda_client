
import '../utils/from_one_to_another.dart';

class RegBody with ToJsonData{
  String inn;
  String email;
  String password;

  RegBody(this.inn, this.email, this.password);

  @override
  Map<String, dynamic> toJsonData() {
    return{
      "email":email,
      "inn": inn,
      "password":password
    };
  }

}