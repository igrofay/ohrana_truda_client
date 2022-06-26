
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ohrana_truda/data/model/passport_organization_body.dart';
import 'package:ohrana_truda/domain/model/passport_organization.dart';

import 'package:ohrana_truda/domain/model/profile_user.dart';
import 'package:ohrana_truda/domain/repository/token.dart';

import '../../domain/repository/profile.dart';
import '../utils/transformers_json_profile.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl with ProfileRepository{
  Dio dio;
  TokenRepository tokenRepository;


  ProfileRepositoryImpl(this.dio, this.tokenRepository);

  @override
  Future<PassportOrganization> getPassportOrganization({String? email}) async {
    final answer = await dio.get(
        "/passport/${email ?? ''}",
        options: Options(headers: {"Authorization" : tokenRepository.getToken()})
    );
    return PO().fromJsonToPassportOrganization(answer.data);
  }

  @override
  Future<ProfileUser> getProfileUser() async {
    final answer = await dio.get(
        "/profile",
      options: Options(headers: {"Authorization" : tokenRepository.getToken()})
    );
    return fromJsonToProfileUser(answer.data);
  }

  @override
  Future<void> savePassportOrganization(PassportOrganization passportOrganization,{String? email}) async{
    await dio.post(
        "/passport/${email ?? ''}",
        options: Options(headers: {"Authorization" : tokenRepository.getToken()}),
      data: PassportOrganizationBody(passportOrganization).toJsonData()
    );
  }

}