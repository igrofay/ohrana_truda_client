
import '../model/passport_organization.dart';
import '../model/profile_user.dart';

mixin ProfileRepository{
  Future<ProfileUser> getProfileUser();
  Future<PassportOrganization> getPassportOrganization({String? email});
  Future<void> savePassportOrganization(PassportOrganization passportOrganization,{String? email});
}