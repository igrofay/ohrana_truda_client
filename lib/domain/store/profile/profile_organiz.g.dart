// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_organiz.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrganizationProfileStore on _OrganizationProfileStore, Store {
  late final _$profileUserAtom =
      Atom(name: '_OrganizationProfileStore.profileUser', context: context);

  @override
  ProfileUser? get profileUser {
    _$profileUserAtom.reportRead();
    return super.profileUser;
  }

  @override
  set profileUser(ProfileUser? value) {
    _$profileUserAtom.reportWrite(value, super.profileUser, () {
      super.profileUser = value;
    });
  }

  late final _$passportOrganizationAtom = Atom(
      name: '_OrganizationProfileStore.passportOrganization', context: context);

  @override
  PassportOrganization? get passportOrganization {
    _$passportOrganizationAtom.reportRead();
    return super.passportOrganization;
  }

  @override
  set passportOrganization(PassportOrganization? value) {
    _$passportOrganizationAtom.reportWrite(value, super.passportOrganization,
        () {
      super.passportOrganization = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_OrganizationProfileStore.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$_OrganizationProfileStoreActionController =
      ActionController(name: '_OrganizationProfileStore', context: context);

  @override
  void saveNewPassportOrganization(PassportOrganization passport) {
    final _$actionInfo =
        _$_OrganizationProfileStoreActionController.startAction(
            name: '_OrganizationProfileStore.saveNewPassportOrganization');
    try {
      return super.saveNewPassportOrganization(passport);
    } finally {
      _$_OrganizationProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profileUser: ${profileUser},
passportOrganization: ${passportOrganization}
    ''';
  }
}
