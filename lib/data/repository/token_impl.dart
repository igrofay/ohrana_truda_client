
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/token.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl with TokenRepository{
  final _keyRefToken = "KEY_REF_TOKEN";
  SharedPreferences sp;
  String? token;


  TokenRepositoryImpl(this.sp){
    token = sp.getString(_keyRefToken)!;
  }

  @override
  String? getToken() => token;

  @override
  void saveToken(String token) {
    this.token = "Bearer $token";
    sp.setString(_keyRefToken, this.token!);
  }

  @override
  void reset() {
    token = '';
    sp.setString(_keyRefToken, token!);
  }

}