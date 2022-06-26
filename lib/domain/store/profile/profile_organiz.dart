
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:ohrana_truda/domain/model/profile_user.dart';

import '../../model/passport_organization.dart';
import '../../repository/profile.dart';

part 'profile_organiz.g.dart';

@injectable
class OrganizationProfileStore = _OrganizationProfileStore with _$OrganizationProfileStore;

abstract class _OrganizationProfileStore with Store{
  final ProfileRepository _profileRepository;

  _OrganizationProfileStore(this._profileRepository){
    load();
  }

  @observable
  ProfileUser? profileUser;
  @observable
  PassportOrganization? passportOrganization;

  @action
  Future<void> load() async {
    _profileRepository.getProfileUser().then((value) => profileUser = value);
    _profileRepository.getPassportOrganization().then((value) => passportOrganization = value);
  }
  @action
  void saveNewPassportOrganization(PassportOrganization passport){
    passportOrganization = passport;
    _profileRepository.savePassportOrganization(passport);
  }

}