
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ohrana_truda/data/model/auth_body.dart';
import 'package:ohrana_truda/data/model/regist_body.dart';

import '../../domain/repository/authentication.dart';
import '../../domain/utils/errors.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl with AuthenticationRepository{
  Dio dio;

  AuthenticationRepositoryImpl(this.dio);

  @override
  Future<String> signIn(String? email, String? inn, String password) async {
    try{
      final answer = await dio.post(
          '/signIn',
          data: AuthBody(inn, email, password).toJsonData()
      );
      return (answer.data as Map<String,String>)['token']!;
    }on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 404:
          throw Error404();
        default:
          throw Exception();
      }
    }
  }

  @override
  Future<String> signUp(String email, String inn, String password) async {
    try{
      final answer = await dio.post(
          '/signUp',
          data: RegBody(inn, email, password).toJsonData()
      );
      return (answer.data as Map<String,String>)['token']!;
    }on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 409:
          throw Error409();
        default:
          throw Exception();
      }
    }
  }

}